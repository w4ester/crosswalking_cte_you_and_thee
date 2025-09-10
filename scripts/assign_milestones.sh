#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI not found. Install from https://cli.github.com/" >&2
  exit 1
fi

gh auth status || { echo "Please run: gh auth login" >&2; exit 1; }

repo=${1:-}
tsv=${2:-issues/issues.tsv}
if [[ -z "$repo" || ! -f "$tsv" ]]; then
  echo "Usage: $0 <owner/repo> <issues.tsv>" >&2
  exit 1
fi

echo "Assigning milestones from $tsv ..."
tail -n +2 "$tsv" | while IFS=$'\t' read -r title labels milestone body; do
  [[ -z "$title" ]] && continue
  echo "- $title -> $milestone"
  num=$(gh issue list --repo "$repo" --search "$title" --state all --limit 1 | awk 'NR==1{print $1}' | tr -d '#') || true
  if [[ -n "${num}" ]]; then
    mnum=$(gh api repos/"$repo"/milestones --jq '.[] | select(.title=="'"$milestone"'") | .number' | head -n1) || true
    if [[ -n "${mnum}" ]]; then
      gh api repos/"$repo"/issues/"$num" -X PATCH -f milestone="$mnum" >/dev/null || echo "  (warn) could not set milestone via API"
    else
      echo "  (warn) milestone not found: $milestone"
    fi
  else
    echo "  (warn) could not find issue for title"
  fi
done
echo "Done."
