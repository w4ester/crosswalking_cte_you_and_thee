import os
from typing import Optional
from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
import httpx
import xmltodict

API_ONET_USER = os.getenv("ONET_USER")
API_ONET_PASS = os.getenv("ONET_PASS")
API_CAREERONESTOP_KEY = os.getenv("CAREERONESTOP_KEY")
API_CAREERONESTOP_USERID = os.getenv("CAREERONESTOP_USERID")

app = FastAPI(title="Career Aggregator API", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=os.getenv("CORS_ORIGINS", "*").split(","),
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


def _extract_text(d, *keys):
    for k in keys:
        if k in d and isinstance(d[k], (str, int)):
            return str(d[k])
        if ("@"+k) in d and isinstance(d["@"+k], (str, int)):
            return str(d["@"+k])
    return ""

def _collect_occupations(node, out):
    if isinstance(node, list):
        for n in node:
            _collect_occupations(n, out)
        return
    if not isinstance(node, dict):
        return
    # Heuristic: many O*NET lists have elements like occupation/career/result with code/title
    code = _extract_text(node, "code", "soc", "onetcode", "id")
    title = _extract_text(node, "title", "name")
    if code and title:
        out.append({"soc": code, "title": title, "summary": _extract_text(node, "description", "summary")})
    for v in node.values():
        _collect_occupations(v, out)

@app.get("/v1/occupations/search")
async def occupations_search(
    q: str = Query("", description="Keyword"),
    riasec: str = Query("", description="RIASEC letters e.g. IRC"),
    job_zone: Optional[int] = Query(None),
    region: str = Query(""),
    radius: str = Query("")
):
    # Placeholder: implement O*NET search proxy
    if not (API_ONET_USER and API_ONET_PASS):
        raise HTTPException(status_code=501, detail="O*NET credentials not configured")
    # Example: call O*NET Web Services (adjust endpoint accordingly)
    url = "https://services.onetcenter.org/ws/online/occupations/"
    auth = (API_ONET_USER, API_ONET_PASS)
    params = {"keyword": q or riasec or "", "start": 1}
    items = []
    try:
        resp = await cached_get_json(url, auth=auth, params=params, timeout=10.0)
        # resp is text (XML); parse
        if isinstance(resp, str):
            data = xmltodict.parse(resp)
        else:
            data = resp
        _collect_occupations(data, items)
    except httpx.HTTPError as e:
        raise HTTPException(status_code=502, detail=f"O*NET error: {e}")
    return {"items": items}


@app.get("/v1/occupations/{soc}")
async def occupation_detail(soc: str, location: Optional[str] = Query("", description="ZIP/state for wage context (optional)")):
    if not (API_ONET_USER and API_ONET_PASS):
        raise HTTPException(status_code=501, detail="O*NET credentials not configured")
    # Attempt to fetch a summary endpoint if available
    url = f"https://services.onetcenter.org/ws/online/occupations/{soc}/summary/"
    auth = (API_ONET_USER, API_ONET_PASS)
    try:
        rtext = await cached_get_json(url, auth=auth, timeout=10.0)
        if isinstance(rtext, str):
            data = xmltodict.parse(rtext)
        else:
            data = rtext
    except httpx.HTTPError as e:
        raise HTTPException(status_code=502, detail=f"O*NET error: {e}")
    # Heuristic extraction
    detail = {"soc": soc, "title": "", "description": "", "riasec": "", "job_zone": None, "tasks": [], "skills": {}}
    def walk(n):
        if isinstance(n, list):
            for x in n: walk(x)
            return
        if not isinstance(n, dict): return
        t = _extract_text(n, "title", "name")
        if t and not detail["title"]: detail["title"] = t
        d = _extract_text(n, "description", "summary")
        if d and not detail["description"]: detail["description"] = d
        rz = _extract_text(n, "riasec")
        if rz and not detail["riasec"]: detail["riasec"] = rz
        jz = _extract_text(n, "jobzone", "job_zone")
        if jz and not detail["job_zone"]:
            try: detail["job_zone"] = int(jz)
            except: detail["job_zone"] = jz
        # tasks list
        if "task" in n:
            tasks = n["task"] if isinstance(n["task"], list) else [n["task"]]
            for t in tasks:
                if isinstance(t, dict):
                    txt = _extract_text(t, "description", "name")
                else:
                    txt = str(t)
                if txt: detail["tasks"].append(txt)
        for v in n.values(): walk(v)
    walk(data)
    # Enrich with wages via CareerOneStop Occupation Profile (if keys configured)
    if API_CAREERONESTOP_KEY and API_CAREERONESTOP_USERID:
        try:
            loc = (location or 'US').strip()
            prof_url = f"https://api.careeronestop.org/v1/occupation/{API_CAREERONESTOP_KEY}/profile"
            headers = {"Authorization": f"Bearer {API_CAREERONESTOP_KEY}", "Accept": "application/json"}
            params = {"onetcode": soc, "location": loc, "userId": API_CAREERONESTOP_USERID}
            pdata = await cached_get_json(prof_url, params=params, headers=headers, timeout=15.0)
            wages = _extract_wages(pdata)
            if wages:
                wages["area"] = loc
                wages["source"] = "CareerOneStop"
                detail["wages"] = wages
        except Exception:
            pass
    return detail

def _extract_wages(node):
    """Heuristic extraction of wages from CareerOneStop Occupation Profile JSON."""
    # Try common known shapes first
    if isinstance(node, dict):
        # Look for keys that often contain wage info
        for k in ("WageInfo", "Wages", "Wage"):
            if k in node and isinstance(node[k], (dict, list)):
                res = _extract_wages(node[k])
                if res: return res
        # Direct median keys
        cand = {}
        for key, val in node.items():
            lk = str(key).lower()
            if any(m in lk for m in ("median", "percentile50")):
                try:
                    num = float(str(val).replace(",",""))
                    cand[lk] = num
                except:  # not numeric
                    pass
        if cand:
            # Return the first found median
            median = cand.get("median") or next(iter(cand.values()))
            return {"median": median}
        # Recurse
        for v in node.values():
            res = _extract_wages(v)
            if res: return res
    elif isinstance(node, list):
        for it in node:
            res = _extract_wages(it)
            if res: return res
    return None


@app.get("/v1/training")
async def training(keyword: str = Query(""), zipcode: str = Query(""), radius: str = Query("")):
    if not (API_CAREERONESTOP_KEY and API_CAREERONESTOP_USERID):
        raise HTTPException(status_code=501, detail="CareerOneStop credentials not configured")
    # CareerOneStop Training Finder
    # API ref: /v1/training/{apikey}/training?keyword=...&zipcode=...
    url = f"https://api.careeronestop.org/v1/training/{API_CAREERONESTOP_KEY}/training"
    headers = {"Authorization": f"Bearer {API_CAREERONESTOP_KEY}", "Accept": "application/json"}
    params = {"keyword": keyword, "zipcode": zipcode, "radius": radius or 25, "userId": API_CAREERONESTOP_USERID}
    try:
        data = await cached_get_json(url, params=params, headers=headers, timeout=15.0)
    except httpx.HTTPError as e:
        raise HTTPException(status_code=502, detail=f"CareerOneStop error: {e}")
    items = []
    for row in (data.get("Schools", []) if isinstance(data, dict) else []):
        items.append({
            "name": row.get("ProgramName") or row.get("SchoolName"),
            "provider": row.get("SchoolName"),
            "location": {"city": row.get("City"), "state": row.get("State"), "zip": row.get("ZIP")},
            "url": row.get("Website") or row.get("SchoolUrl"),
            "type": "Training"
        })
    return {"items": items}


@app.get("/v1/apprenticeships")
async def apprenticeships(keyword: str = Query(""), location: str = Query("")):
    """Approximate apprenticeships by filtering training results for 'apprentice' terms.
    This uses CareerOneStop Training Finder until a dedicated apprenticeship endpoint is integrated.
    """
    if not (API_CAREERONESTOP_KEY and API_CAREERONESTOP_USERID):
        raise HTTPException(status_code=501, detail="CareerOneStop credentials not configured")
    # Reuse training API and filter by apprenticeship terms
    url = f"https://api.careeronestop.org/v1/training/{API_CAREERONESTOP_KEY}/training"
    headers = {"Authorization": f"Bearer {API_CAREERONESTOP_KEY}", "Accept": "application/json"}
    params = {"keyword": keyword, "zipcode": location, "radius": 25, "userId": API_CAREERONESTOP_USERID}
    try:
        data = await cached_get_json(url, params=params, headers=headers, timeout=15.0)
    except httpx.HTTPError as e:
        raise HTTPException(status_code=502, detail=f"CareerOneStop error: {e}")
    terms = (keyword or "").lower() + " apprentice"
    items = []
    for row in (data.get("Schools", []) if isinstance(data, dict) else []):
        name = row.get("ProgramName") or row.get("SchoolName") or ""
        if any(t in (name or "").lower() for t in ["apprentice", "apprenticeship"]):
            items.append({
                "name": name,
                "provider": row.get("SchoolName"),
                "location": {"city": row.get("City"), "state": row.get("State"), "zip": row.get("ZIP")},
                "url": row.get("Website") or row.get("SchoolUrl"),
                "type": "Apprenticeship"
            })
    return {"items": items}

# -------- Simple in-memory cache (TTL) --------
from time import time
_CACHE = {}
_TTL = int(os.getenv("CACHE_TTL_SECONDS", "600"))

async def cached_get_json(url: str, *, params=None, headers=None, auth=None, timeout=10.0):
    key = (url, tuple(sorted((params or {}).items())), tuple(sorted((headers or {}).items())) )
    now = time()
    if key in _CACHE:
        exp, data = _CACHE[key]
        if now < exp:
            return data
    async with httpx.AsyncClient(timeout=timeout) as client:
        r = await client.get(url, params=params, headers=headers, auth=auth)
        r.raise_for_status()
        # Try JSON first, else return text
        try:
            data = r.json()
        except ValueError:
            data = r.text
    _CACHE[key] = (now + _TTL, data)
    return data


@app.get("/v1/local-help/ajc")
async def local_help(zip: str = Query("")):
    if not (API_CAREERONESTOP_KEY and API_CAREERONESTOP_USERID):
        raise HTTPException(status_code=501, detail="CareerOneStop credentials not configured")
    url = f"https://api.careeronestop.org/v1/ajc/locations/{API_CAREERONESTOP_KEY}/{zip}"
    headers = {"Authorization": f"Bearer {API_CAREERONESTOP_KEY}", "Accept": "application/json"}
    params = {"userId": API_CAREERONESTOP_USERID}
    async with httpx.AsyncClient(timeout=10.0) as client:
        try:
            r = await client.get(url, params=params, headers=headers)
            r.raise_for_status()
            data = r.json()
        except httpx.HTTPError as e:
            raise HTTPException(status_code=502, detail=f"CareerOneStop error: {e}")
    items = []
    for row in (data.get("AJCLocations", []) if isinstance(data, dict) else []):
        items.append({
            "name": row.get("Name"),
            "location": {"city": row.get("City"), "state": row.get("State"), "zip": row.get("Zip")},
            "url": row.get("Website")
        })
    return {"items": items}
