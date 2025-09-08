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
    async with httpx.AsyncClient(timeout=10.0) as client:
        try:
            resp = await client.get(url, auth=auth, params=params)
            resp.raise_for_status()
            data = xmltodict.parse(resp.text)
            _collect_occupations(data, items)
        except httpx.HTTPError as e:
            raise HTTPException(status_code=502, detail=f"O*NET error: {e}")
    return {"items": items}


@app.get("/v1/occupations/{soc}")
async def occupation_detail(soc: str):
    if not (API_ONET_USER and API_ONET_PASS):
        raise HTTPException(status_code=501, detail="O*NET credentials not configured")
    # Attempt to fetch a summary endpoint if available
    url = f"https://services.onetcenter.org/ws/online/occupations/{soc}/summary/"
    auth = (API_ONET_USER, API_ONET_PASS)
    async with httpx.AsyncClient(timeout=10.0) as client:
        try:
            r = await client.get(url, auth=auth)
            r.raise_for_status()
            data = xmltodict.parse(r.text)
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
    return detail


@app.get("/v1/training")
async def training(keyword: str = Query(""), zipcode: str = Query(""), radius: str = Query("")):
    if not (API_CAREERONESTOP_KEY and API_CAREERONESTOP_USERID):
        raise HTTPException(status_code=501, detail="CareerOneStop credentials not configured")
    # CareerOneStop Training Finder
    # API ref: /v1/training/{apikey}/training?keyword=...&zipcode=...
    url = f"https://api.careeronestop.org/v1/training/{API_CAREERONESTOP_KEY}/training"
    headers = {"Authorization": f"Bearer {API_CAREERONESTOP_KEY}", "Accept": "application/json"}
    params = {"keyword": keyword, "zipcode": zipcode, "radius": radius or 25, "userId": API_CAREERONESTOP_USERID}
    async with httpx.AsyncClient(timeout=15.0) as client:
        try:
            r = await client.get(url, params=params, headers=headers)
            r.raise_for_status()
            data = r.json()
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
    # Placeholder: apprenticeship.gov scraperless API is limited; integrate when available.
    return {"items": []}


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
