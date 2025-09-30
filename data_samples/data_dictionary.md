# Dataset Data Dictionary

Primary dataset: `data_samples/full_dataset.jsonl`

| Field | Type | Description |
| --- | --- | --- |
| `id` | string | Stable identifier for the chunk (slugged by page/record). |
| `title` | string | Human-readable title for the content segment. |
| `content` | string | Cleaned Markdown text describing the section or table row. |
| `summary` | string | One to three sentence synopsis highlighting key points. |
| `source_url` | string | Relative file path to the source document within the repository (acts as canonical link). |
| `tags` | array of strings | Topical labels (page, cluster, sector, pathway, etc.) to assist filtering at query time. |
| `created_at` | string (ISO 8601) | File modification timestamp captured during extraction. |
| `updated_at` | string (ISO 8601) | Same as `created_at` for this pilot; will diverge when change history is available. |
| `metadata` | object | Source-specific metadata (e.g., audience, program, sector, credentials, source URL). |
| `metadata.file_path` | string | Relative path to source file. |
| `metadata.section` | string | Logical section name (introduction, audience-guidance, info) for narrative records. |
| `metadata.audience` | string | Target audience label when applicable. |
| `metadata.program` | string | High school program for crosswalk rows. |
| `metadata.institution` | string | Postsecondary institution name. |
| `metadata.sector` | string | Institution type (Community College or 4-Year University). |
| `metadata.degree` | string | Degree or award level. |
| `metadata.major` | string | Major or track name. |
| `metadata.certificates` | string | Lower-division certificates available (if any). |
| `metadata.credentials` | string | Credential alignment description. |
| `metadata.source` | string | External URL cited in the table row. |
| `metadata.citation_label` | string | Accessibility-friendly label to display in citation UI elements. |
| `metadata.aria_label` | string | Suggested ARIA label text for buttons or links pointing to this source. |
| `metadata.programArea` | string | Program area code (e.g., ECE, PROG, CYBER) when defined on the source page. |
| `metadata.programs` | string | Program titles or award list (crosswalk JS arrays). |
| `metadata.features` | string | Key feature notes pulled from crosswalk tables. |
| `metadata.type` | string | Source institution type (Community College, University, Private). |
| `metadata.strand` | string | Static table strand label (e.g., Renewable Energy) when available. |
