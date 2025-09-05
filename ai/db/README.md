# AI DB (Multi‑Tenant, RLS)

This is the database layer for the AI platform (separate branch). It uses Postgres with row‑level security (RLS) and session‑based tenant scoping.

## Quickstart

1) Start Postgres
- docker compose -f ai/db/compose.yaml up -d db

2) Apply migrations (in order)
- psql postgresql://app:app@localhost:5432/app -f ai/db/migrations/0001_base.sql

3) Sanity test
- psql ... -c "SELECT app.set_session('00000000-0000-0000-0000-000000000000'::uuid, NULL, false)"

## Session‑based tenancy
The API sets per‑request session variables:
- app.tenant_id: UUID of the tenant/org
- app.user_id: UUID of the authenticated user (optional initially)
- app.is_admin: 't' or 'f'

RLS policies read these values to filter rows, e.g. tenant_id = current_setting('app.tenant_id')::uuid. Admins bypass RLS via policy clauses.

## Migrations
- 0001_base.sql — schema + roles + tenants + helpers + baseline RLS
- Next (proposed): users + profiles; journey results; plans; clusters (global/tenant overrides)

## Notes
- Requires Postgres 13+ and the pgcrypto extension (for gen_random_uuid).
- Keep application login roles as members of app_auth or app_admin.

