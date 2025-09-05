# Contributing

## Workflow
- Create a branch from `main`:
  - `feature/*` for features
  - `fix/*` for fixes
  - `chore/*` for maintenance
  - `ai/*` for the AI platform work
- Open a Pull Request using the PR template. Include screenshots for UI.
- Require at least one reviewer before merging.

## Commit Messages
- Use brief, descriptive messages. Conventional prefixes encouraged:
  - `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `style:`
- Keep subject under ~72 chars; add details in body if needed.

## Two Worlds
- Web Demo (this branch): static HTML/JS crosswalks, Student Journey, Portfolio/Resume.
- AI Platform (separate branch): Svelte(TS)+Vite+Tailwind, FastAPI, Postgres (Docker), Ollama/OpenAI chat. Multi‑tenant ready.

## Local Dev
- Static pages: open HTML files in a browser.
- No server required for demo; data stored in `localStorage`.

## PR Quality Bar
- Scope limited to the change
- Clear user‑visible description
- No broken links/console errors
- Tested on desktop + mobile widths

