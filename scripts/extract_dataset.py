#!/usr/bin/env python3
import json
import re
import hashlib
from datetime import datetime, timezone
from pathlib import Path
from typing import List, Dict, Any
from urllib.parse import quote_plus

from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parents[1]
OUTPUT_DIR = ROOT / "data_samples"
OUTPUT_FILE = OUTPUT_DIR / "full_dataset.jsonl"
MANIFEST_FILE = OUTPUT_DIR / "full_manifest.json"


# ------------ General helpers ------------ #

def iso_timestamp(path: Path) -> str:
    ts = datetime.fromtimestamp(path.stat().st_mtime, tz=timezone.utc)
    return ts.isoformat()


def slugify(text: str) -> str:
    text = text.lower()
    text = re.sub(r"[^a-z0-9]+", "-", text)
    text = re.sub(r"-+", "-", text).strip("-")
    return text or "item"


def clean_text(text: str) -> str:
    return re.sub(r"\s+", " ", text or "").strip()


def normalize_js_block(block: str) -> str:
    result: List[str] = []
    i = 0
    length = len(block)
    while i < length:
        ch = block[i]
        if ch in ('"', "'"):
            quote = ch
            result.append('"')
            i += 1
            while i < length:
                c = block[i]
                if c == '\\':
                    result.append('\\\\')
                    i += 1
                    if i < length:
                        result.append(block[i])
                        i += 1
                    continue
                if c == quote:
                    break
                if c == '"':
                    result.append('\\"')
                else:
                    result.append(c)
                i += 1
            result.append('"')
            i += 1
        elif ch.isalpha() or ch == '_':
            j = i
            while j < length and (block[j].isalnum() or block[j] == '_'):
                j += 1
            identifier = block[i:j]
            k = j
            while k < length and block[k].isspace():
                k += 1
            if k < length and block[k] == ':':
                result.append('"' + identifier + '"')
                i = j
            else:
                result.append(identifier)
                i = j
        else:
            result.append(ch)
            i += 1
    json_ready = ''.join(result)
    json_ready = re.sub(r",\s*(\]|\})", r"\1", json_ready)
    return json_ready


def extract_js_array(html: str, var_name: str) -> List[Dict[str, Any]]:
    markers = [
        f"{var_name} = [",
        f"const {var_name} = [",
        f"let {var_name} = [",
        f"var {var_name} = [",
    ]
    idx = -1
    for marker in markers:
        idx = html.rfind(marker)
        if idx != -1:
            break
    if idx == -1:
        return []
    start = html.find('[', idx)
    if start == -1:
        return []
    depth = 0
    end = -1
    for pos in range(start, len(html)):
        char = html[pos]
        if char == '[':
            depth += 1
        elif char == ']':
            depth -= 1
            if depth == 0:
                end = pos
                break
    if end == -1:
        return []
    block = html[start + 1:end]
    block = re.sub(r"^\s*//.*$", "", block, flags=re.M)
    block = re.sub(r"/\*.*?\*/", "", block, flags=re.S)
    json_ready = normalize_js_block(block)
    json_text = '[' + json_ready.strip() + ']'
    return json.loads(json_text)


def extract_domain_map(html: str, var_name: str = "institutionDomains") -> Dict[str, str]:
    pattern = re.compile(var_name + r"\s*=\s*\{(.*?)\}", re.S)
    match = pattern.search(html)
    if not match:
        return {}
    block = match.group(1)
    pairs = re.findall(r'(["\'])(.+?)\1\s*:\s*(["\'])(.+?)\3', block)
    return {key: value for _, key, _, value in pairs}


def build_source_url(institution: str, program: str, explicit: str, domain_map: Dict[str, str]) -> str:
    if explicit:
        return explicit
    domain = domain_map.get(institution)
    if domain:
        if domain.startswith("http"):
            return domain
        return f"https://{domain}"
    query = " ".join(filter(None, [institution, program]))
    return f"https://www.google.com/search?q={quote_plus(query)}"


def base_metadata(path: Path) -> Dict[str, Any]:
    return {
        "file_path": str(path.relative_to(ROOT)),
    }


def record_common(path: Path, title: str, content: str, summary: str, tags: List[str], metadata: Dict[str, Any]) -> Dict[str, Any]:
    file_mtime = iso_timestamp(path)
    meta = base_metadata(path)
    meta.update(metadata)
    meta.setdefault("citation_label", title)
    meta.setdefault("aria_label", f"{title}")
    return {
        "id": slugify(f"{Path(path).stem}-{title}"),
        "title": title,
        "content": content.strip(),
        "summary": clean_text(summary) if summary else summary,
        "source_url": str(path.relative_to(ROOT)),
        "tags": tags,
        "created_at": file_mtime,
        "updated_at": file_mtime,
        "metadata": meta,
    }


# ------------ Page-specific extractors ------------ #

def extract_index(path: Path) -> List[Dict[str, Any]]:
    html = path.read_text(encoding="utf-8")
    soup = BeautifulSoup(html, "html.parser")
    records: List[Dict[str, Any]] = []
    title_el = soup.find("h1")
    lead_el = soup.select_one("p.lead")
    if title_el and lead_el:
        title = clean_text(title_el.get_text())
        lead = clean_text(lead_el.get_text())
        content = f"# {title}\n\n{lead}"
        records.append(record_common(
            path,
            title,
            content,
            lead,
            ["page:index", "topic:overview"],
            {
                "section": "introduction",
                "aria_label": f"{title} introduction",
            },
        ))
    # Audience cards
    for idx, card in enumerate(soup.select(".grid .card"), start=1):
        heading = card.find("h3")
        if not heading:
            continue
        card_title = clean_text(heading.get_text())
        text = " ".join(clean_text(p.get_text()) for p in card.find_all("p"))
        content = f"## {card_title}\n\n{text}"
        records.append(record_common(
            path,
            f"Audience Guidance — {card_title}",
            content,
            text,
            ["page:index", "section:audiences"],
            {
                "section": "audience-guidance",
                "audience": card_title,
                "aria_label": f"Audience guidance for {card_title}",
            },
        ))
    # Info sections
    for idx, section in enumerate(soup.select(".info-section"), start=1):
        heading = section.find("h2")
        if not heading:
            continue
        head_text = clean_text(heading.get_text())
        parts = [f"## {head_text}"]
        for child in section.children:
            if getattr(child, "name", None) == "p":
                parts.append(clean_text(child.get_text()))
            elif getattr(child, "name", None) == "h3":
                parts.append(f"### {clean_text(child.get_text())}")
            elif getattr(child, "name", None) == "ul":
                bullets = [f"- {clean_text(li.get_text())}" for li in child.find_all("li")]
                parts.extend(bullets)
        content = "\n\n".join(filter(None, parts))
        summary = parts[1] if len(parts) > 1 else head_text
        tags = ["page:index", "section:info"]
        if "Contact" in head_text:
            tags.append("topic:contact")
        records.append(record_common(
            path,
            head_text,
            content,
            summary,
            tags,
            {
                "section": "info",
                "aria_label": f"{head_text} section",
            },
        ))
    return records


def extract_pss(path: Path) -> List[Dict[str, Any]]:
    html = path.read_text(encoding="utf-8")
    data_rows = extract_js_array(html, "allData")
    records: List[Dict[str, Any]] = []
    base_tags = ["page:pss_crosswalk", "cluster:public-safety-services", "pathway:postsecondary-credential"]
    for row in data_rows:
        program = row.get("program", "")
        institution = row.get("institution", "")
        degree = row.get("degree", "")
        major = row.get("major", "")
        credentials = row.get("credentials", "")
        title = f"{institution} — {program}"
        bullets = [
            f"- **Program**: {program}",
            f"- **Institution**: {institution}",
            f"- **Sector**: {row.get('sector')}",
            f"- **Degree**: {degree}",
            f"- **Program/Major**: {major}",
            f"- **Lower Division Certificates**: {row.get('certificates') or '-'}",
            f"- **Credential Content in Major?**: {credentials}",
            f"- **Source**: {row.get('source')}",
        ]
        content = f"### {title}\n\n" + "\n".join(bullets)
        summary = f"{institution} offers {degree} in {major} for the {program} pathway; credentials: {credentials}"
        tags = base_tags + [f"program:{slugify(program)}"]
        sector = row.get("sector")
        if sector:
            tags.append(f"sector:{slugify(sector)}")
        metadata = {
            **row,
            "citation_label": title,
            "aria_label": f"{title}, credentials: {credentials}",
        }
        records.append(record_common(path, title, content, summary, tags, metadata))
    return records


def format_feature_list(values: str, bullet_label: str) -> str:
    if not values:
        return f"- **{bullet_label}**: -"
    items = [v.strip() for v in values.split(',') if v.strip()]
    if not items:
        return f"- **{bullet_label}**: -"
    return f"- **{bullet_label}**: " + ", ".join(items)


def extract_crosswalk_with_programs(path: Path, page_tag: str, cluster_tag: str) -> List[Dict[str, Any]]:
    html = path.read_text(encoding="utf-8")
    data_rows = extract_js_array(html, "programData")
    domain_map = extract_domain_map(html)
    records: List[Dict[str, Any]] = []
    for row in data_rows:
        institution = row.get("institution", "")
        programs = row.get("programs") or row.get("program") or row.get("major") or ""
        title = f"{institution} — {programs}" if programs else institution
        program_area = row.get("programArea")
        program_label = program_area if program_area else row.get("programType")
        type_val = row.get("type") or row.get("sector")
        certificates = row.get("certificates", "")
        features = row.get("features", "")
        credentials = row.get("credentials", "")
        source = build_source_url(institution, programs, row.get("source"), domain_map)
        bullets = [
            f"- **Institution**: {institution}",
        ]
        if program_label:
            bullets.append(f"- **Program Area**: {program_label}")
        if type_val:
            bullets.append(f"- **Type**: {type_val}")
        if programs:
            bullets.append(f"- **Programs**: {programs}")
        bullets.append(format_feature_list(certificates, "Certificates"))
        if features:
            bullets.append(f"- **Key Features**: {features}")
        bullets.append(format_feature_list(credentials, "Credentials"))
        bullets.append(f"- **Source**: {source}")
        content = f"### {title}\n\n" + "\n".join(bullets)
        summary_parts = [institution]
        if programs:
            summary_parts.append(f"offers {programs}")
        if type_val:
            summary_parts.append(f"({type_val})")
        if credentials:
            summary_parts.append(f"credentials: {credentials}")
        summary = clean_text(" ".join(summary_parts))
        tags = [page_tag, cluster_tag, "pathway:postsecondary-credential"]
        if program_area:
            tags.append(f"program-area:{slugify(program_area)}")
        if type_val:
            tags.append(f"sector:{slugify(type_val)}")
        metadata = {
            **row,
            "source": source,
            "citation_label": title,
            "aria_label": f"{title}, credentials: {credentials or 'not specified'}",
        }
        records.append(record_common(path, title, content, summary, tags, metadata))
    return records


def extract_static_table(path: Path, page_tag: str, cluster_tag: str, table_selector: str = "#dataTable") -> List[Dict[str, Any]]:
    html = path.read_text(encoding="utf-8")
    soup = BeautifulSoup(html, "html.parser")
    table = soup.select_one(table_selector)
    if not table:
        return []
    tbody = table.find("tbody") or table
    rows = tbody.find_all("tr")
    records: List[Dict[str, Any]] = []
    if not rows:
        return records
    for row in rows:
        cells = [cell.get_text(strip=True) for cell in row.find_all("td")]
        if len(cells) < 6:
            continue
        strand, institution, sector, degree, program, certificates, credentials, *rest = cells + ["", ""]
        source_cell = rest[0] if rest else ""
        source = source_cell
        if source and not source.lower().startswith("http"):
            source = f"https://{source.strip()}"
        title = f"{institution} — {program}" if program else institution
        bullets = [
            f"- **Program Strand**: {strand}",
            f"- **Institution**: {institution}",
            f"- **Sector**: {sector}",
            f"- **Degree**: {degree}",
            f"- **Program**: {program}",
            f"- **Certificates**: {certificates or '-'}",
            f"- **Credential Alignment**: {credentials or '-'}",
        ]
        if source:
            bullets.append(f"- **Source**: {source}")
        content = f"### {title}\n\n" + "\n".join(bullets)
        summary = f"{institution} ({sector}) — {degree} {program}; credentials: {credentials or 'not listed'}"
        tags = [page_tag, cluster_tag, "pathway:postsecondary-credential"]
        if strand:
            tags.append(f"program-strand:{slugify(strand)}")
        if sector:
            tags.append(f"sector:{slugify(sector)}")
        metadata = {
            "strand": strand,
            "institution": institution,
            "sector": sector,
            "degree": degree,
            "program": program,
            "certificates": certificates,
            "credentials": credentials,
            "source": source,
            "citation_label": title,
            "aria_label": f"{title}, credentials: {credentials or 'not specified'}",
        }
        records.append(record_common(path, title, content, summary, tags, metadata))
    return records


# ------------ Aggregation ------------ #

def gather_records() -> List[Dict[str, Any]]:
    records: List[Dict[str, Any]] = []
    records.extend(extract_index(ROOT / "index.html"))
    records.extend(extract_pss(ROOT / "pss_crosswalk.html"))
    records.extend(extract_crosswalk_with_programs(ROOT / "003_ed_crosswalk-table.html", "page:education_crosswalk", "cluster:education"))
    records.extend(extract_crosswalk_with_programs(ROOT / "dt-crosswalk-table.html", "page:dt_crosswalk", "cluster:digital-technology"))
    records.extend(extract_crosswalk_with_programs(ROOT / "enr-crosswalk-table.html", "page:enr_crosswalk", "cluster:enr"))
    records.extend(extract_static_table(ROOT / "003_table_enr_renewable_energy_crosswalk_table.html", "page:enr_crosswalk_static", "cluster:enr", "#enrRenewTable"))
    return records


# ------------ Output helpers ------------ #

def write_jsonl(records: List[Dict[str, Any]], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as fh:
        for record in records:
            fh.write(json.dumps(record, ensure_ascii=False) + "\n")


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()


def build_manifest(records: List[Dict[str, Any]], sources: List[Path]) -> Dict[str, Any]:
    counts: Dict[str, int] = {}
    for record in records:
        rel = record["source_url"]
        counts[rel] = counts.get(rel, 0) + 1
    manifest_sources = []
    for source in sources:
        rel = str(source.relative_to(ROOT))
        manifest_sources.append({
            "file": rel,
            "records": counts.get(rel, 0),
            "sha256": sha256_file(source),
        })
    return {
        "extraction_date": datetime.now(timezone.utc).isoformat(),
        "sources": manifest_sources,
        "total_records": len(records),
        "output": {
            "file": str(OUTPUT_FILE.relative_to(ROOT)),
            "sha256": sha256_file(OUTPUT_FILE),
        },
    }


def main():
    records = gather_records()
    write_jsonl(records, OUTPUT_FILE)
    source_paths = [
        ROOT / "index.html",
        ROOT / "pss_crosswalk.html",
        ROOT / "003_ed_crosswalk-table.html",
        ROOT / "dt-crosswalk-table.html",
        ROOT / "enr-crosswalk-table.html",
        ROOT / "003_table_enr_renewable_energy_crosswalk_table.html",
    ]
    manifest = build_manifest(records, source_paths)
    with MANIFEST_FILE.open("w", encoding="utf-8") as fh:
        json.dump(manifest, fh, ensure_ascii=False, indent=2)
    print(f"Wrote {len(records)} records to {OUTPUT_FILE}")
    print(f"Manifest saved to {MANIFEST_FILE}")


if __name__ == "__main__":
    main()
