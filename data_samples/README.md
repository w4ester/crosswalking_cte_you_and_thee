# Dataset Extraction Notes

## Outputs
- Pilot slice: `pilot_sample.jsonl` / `pilot_manifest.json` (index + initial PSS sample for quick review).
- Full corpus: `full_dataset.jsonl` / `full_manifest.json` (260 records covering index narrative plus Education, Digital Technology, ENR, and PSS crosswalk tables).

## Method
- `scripts/extract_dataset.py` walks each crosswalk page, normalizes embedded JS arrays or static tables into Markdown bullet blocks, and attaches the original row metadata.
- `BeautifulSoup` lifts index content (hero, audience cards, info panels) while stripping decorative layout elements.
- File modification timestamps from the source files populate `created_at`/`updated_at` for every record.
- Page-level domain maps feed canonical URLs; when a domain is missing, a Google search fallback keeps the citation link useful.

## Filters & Assumptions
- Decorative markup (buttons, wrappers, nav) is dropped; headings, unordered lists, and table semantics are preserved verbatim.
- JS comments are stripped prior to parsing; a tokenizer wraps unquoted object keys without touching string literals that contain colons.
- The static ENR table (`003_table_enr_renewable_energy_crosswalk_table.html`) is ingested alongside the dynamic JS tables, so downstream dedupe may be desirable.

## Known Gaps
- Summaries remain heuristic; longer narrative sections could be auto-chunked if additional pages are added later.
- CSV sources (e.g., `Education_Cluster_Crosswalk.csv`) are not yet normalized because equivalent data exists in the HTML arrays.
- Duplicate institution/program combinations may surface across static and dynamic ENR tables; dedupe on `(institution, program)` if required.

## Accessibility Metadata
- Each record includes `metadata.citation_label` for the visible citation text and `metadata.aria_label` for screen-reader announcements.
- When rendering citations in chat, expose them as focusable buttons/links using these labels so the UI stays WCAG-compliant.
