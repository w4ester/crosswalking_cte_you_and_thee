# Student Journey Cleanup — TODO

## Goals
- Declutter Student Journey UI for teens (clean, fast, focused).
- Keep “Guided Journey” primary; move advanced options behind collapsibles.
- Establish clean data flow with local persistence (no server required yet).
- Prepare for “real choices” integration when cluster data lands.

## UX Simplification (Web Demo)
- Hero card: Guided Journey (start/resume/reset) + Region/Radius.
- Student Profile (first name, grade, school, zip) with local save.
- Quick Picks row (Tech, Helper/Educator, Builder, Creative) → prefill RIASEC.
- Advanced Interests (collapsed): RIASEC checklists + Calculate result.
- More Interests (collapsed): True Colors + Team Role.
- Suggested Clusters: multi‑match with “Why” and CareerCoach link.
- Plan Preview: 6‑Year Plan mini, with Copy Plan and link to Portfolio.
- Data Controls (collapsed): Save/Load/Clear/Import/Export JSON.

## Data & Structure
- LocalStorage keys: studentProfileV1, studentAssessmentsV1, studentPlanV1, regionSettingsV1.
- Shareable URL param: `share=` Encoded wizard answers + region.
- Plan is shared between Journey and Portfolio.

## Near‑Term Enhancements
- Add “Copy Journey” export (profile + interests + suggestions + plan) as text.
- Add onboarding tooltip to guide the flow (optional, non‑modal).
- Add Health, Business, Arts mappings as data arrives.
- Add per‑cluster “Add to Plan” shortcuts when data is ready.

## AI Platform (Separate Branch)
- Tech stack: SvelteKit (Vite) + Tailwind; FastAPI; Postgres (Docker); Ollama + OpenAI‑compatible chat.
- Tenancy: multi‑tenant (district/school/org) with SSO plan (future).
- Models: cluster specialist “modelfiles” and chat flows (survey → options → chat).
- Merge approach: feature branch PRs, selectively backport UX to demo.

## Git Workflow
- Branch naming: `feature/...`, `chore/...`, `fix/...`, `ai/...`.
- Open PRs with template; require 1 reviewer approval for `main`.
- Conventional commits (light): `feat:`, `fix:`, `chore:`, `docs:`.

