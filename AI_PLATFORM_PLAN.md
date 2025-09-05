# AI Platform Plan (Separate Branch)

## Goal
Multi-tenant AI companion for Maryland students (12+) to explore clusters through surveys and chat. Separate branch; integrate with demo later.

## Stack
- Frontend: SvelteKit (Vite) + Tailwind CSS
- API: FastAPI (Python)
- DB: PostgreSQL via Docker Compose
- AI: Ollama + OpenAI-compatible API (chat completions). Model files per cluster (“specialists”).

## Milestones
- Bootstrap SvelteKit + Tailwind; auth shell (stub).
- FastAPI service with healthcheck; Postgres schema for tenants, users, sessions, survey results.
- Chat gateway: OpenAI-style endpoints; adapter to Ollama.
- Survey engine: JSON schema-driven forms; save to DB; return recommendations.
- Multitenancy controls (org_id headers, row-level scoping).

## Dev Commands (proposed)
- Branch: `ai/bootstrapping`
- Start DB: `docker compose up -d db`
- API: `uvicorn app.main:app --reload`
- Web: `pnpm dev`

## Integration Later
- Pull refined UX patterns from demo (Journey, Plan/Portfolio).
- Expose read-only endpoints to hydrate demo when desired.

