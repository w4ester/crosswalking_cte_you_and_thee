# Career & Occupation APIs (Free/No-cost Options)

These APIs provide free access to occupation, skills, wage, and job information. Most require a simple (free) registration key.

## O*NET Web Services (Free API)
- Site: https://services.onetcenter.org/
- Data: Occupations, tasks, knowledge/skills/abilities (KSAs), interests (RIASEC), Job Zones, technology skills, related occupations.
- Auth: API Key (free registration).
- Notes: Authoritative US source for occupation data; perfect for RIASEC alignment and cluster mapping.
- Example: GET /ws/online/occupations/?keyword=data&start=1

## CareerOneStop APIs (US DOL; Free API)
- Site: https://www.careeronestop.org/Developers/WebAPI/web-api.aspx
- Data: Occupation profiles, wages, training finder, local help (AJC/youth), certifications, skills.
- Auth: API Key (free registration).
- Notes: Great complement to O*NET for local services and training.
- Examples:
  - Occupation Profile: /v1/occupation/{apikey}/profile?onetcode=15-1252.00&location=21201
  - Training Finder: /v1/training/{apikey}/training?keyword=data&zipcode=21201
  - Local Help (AJC): /v1/ajc/locations/{apikey}/{zipcode}

## USAJOBS (US OPM; Free API)
- Site: https://developer.usajobs.gov/
- Data: Federal job postings.
- Auth: Email/User-Agent header (free registration).
- Notes: Useful for exposing federal internships and jobs by location/series.

## BLS Public Data (Free API)
- Site: https://www.bls.gov/developers/
- Data: Employment, wages, and indexes (timeseries). OEWS not directly via API but useful for macro context.
- Auth: Free key recommended.

## Adzuna (3rd-party; Free dev tier)
- Site: https://developer.adzuna.com/overview
- Data: Job ads; location and keyword filters.
- Auth: App ID and Key (free dev plan limits apply).

## Notes for Integration
- Start with O*NET (occupations/skills/interests) + CareerOneStop (local help & training).
- Use Student Journey inputs (RIASEC, team role, colors) to map to O*NET SOCs, then enrich with CareerOneStop and optional job feeds.
- When the AI branch is live, cache/normalize selected occupation snapshots per tenant to keep latency low and ensure consistent UX.

