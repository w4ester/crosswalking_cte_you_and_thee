# Aggregator API (FastAPI) — Spec & Plan

We’ll host a small FastAPI service that proxies and normalizes external career APIs (O*NET, CareerOneStop, Apprenticeship.gov, USAJOBS). The Explore page calls these endpoints; keys never live in the browser.

## Endpoints (v1)
- GET /v1/occupations/search?q=&riasec=&job_zone=&region=&radius=
- GET /v1/occupations/{soc}
- GET /v1/training?keyword=&zipcode=&radius=
- GET /v1/apprenticeships?keyword=&location=
- GET /v1/local-help/ajc?zip=
- GET /v1/suggest?riasec=&colors=&role=  (optional)

## Response shapes
- Occupations.search → { items: [ { soc, title, summary, riasec, job_zone, wages?, related? } ] }
- Occupation.detail → { soc, title, description, riasec, job_zone, tasks[], skills{...}, wages{...}, related[] }
- Training → { items: [ { name, provider, location{ city,state,zip }, url, type, distance_miles? } ] }
- Apprenticeships → { items: [ { name, provider, location{...}, url } ] }
- Local Help (AJC) → { items: [ { name, location{...}, url } ] }

## Keys
- O*NET Web Services: https://services.onetcenter.org/
- CareerOneStop: https://www.careeronestop.org/Developers/WebAPI/web-api.aspx
- USAJOBS: https://developer.usajobs.gov/
- Apprenticeship.gov: public search pages + potential scrape-free endpoints (investigate)

## TODO
- [ ] Create `api/main.py` FastAPI app with CORS enabled for site origin(s)
- [ ] Add simple env loader and config for API keys
- [ ] Implement search/detail with timeouts and defensive error handling
- [ ] Normalize responses to shapes above; add basic caching later
- [ ] Document `.env` and sample requests

