# Aggregator API (FastAPI) — Spec & Plan

We’ll host a small FastAPI service that proxies and normalizes external career APIs (O*NET, CareerOneStop, Apprenticeship.gov, USAJOBS). The Explore page calls these endpoints; keys never live in the browser.

## Endpoints (v1)
- GET /v1/occupations/search?q=&riasec=&job_zone=&region=&radius=
- GET /v1/occupations/{soc}
- GET /v1/training?keyword=&zipcode=&radius=
- GET /v1/apprenticeships?keyword=&location=
- GET /v1/local-help/ajc?zip=
- GET /v1/scholarships?keyword=&state=
- GET /v1/suggest?riasec=&colors=&role=  (optional)

## Response shapes
- Occupations.search → { items: [ { soc, title, summary, riasec, job_zone, wages?, related? } ] }
- Occupation.detail → { soc, title, description, riasec, job_zone, tasks[], skills{...}, wages{...}, related[] }
- Training → { items: [ { name, provider, location{ city,state,zip }, url, type, distance_miles? } ] }
- Apprenticeships → { items: [ { name, provider, location{...}, url } ] }
- Local Help (AJC) → { items: [ { name, location{...}, url } ] }
- Scholarships → { items: [ { name, provider, location{ state }, amount, deadline, url, type } ] }

## Keys
- O*NET Web Services: https://services.onetcenter.org/
- CareerOneStop: https://www.careeronestop.org/Developers/WebAPI/web-api.aspx
- USAJOBS: https://developer.usajobs.gov/
- Apprenticeship.gov: public search pages + potential scrape-free endpoints (investigate)

## Run locally

1) Create and activate a virtualenv, then install deps:

   pip install -r api/requirements.txt

2) Copy env and set your keys:

   cp api/.env.example .env
   # Fill in ONET_USER/ONET_PASS and CAREERONESTOP_USERID/CAREERONESTOP_KEY

3) Start the server:

   uvicorn api.server.main:app --reload --port 8000

4) Point the web app at your API (in dev console):

   localStorage.apiBase = 'http://localhost:8000'

## Notes
- O*NET returns XML by default; parsing and richer normalization are to be added.
- CareerOneStop endpoints used: Training Finder and AJC Local Help.
- Add basic caching later for performance.
