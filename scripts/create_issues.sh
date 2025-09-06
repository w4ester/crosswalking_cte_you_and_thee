#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI not found. Install from https://cli.github.com/" >&2
  exit 1
fi

gh auth status || { echo "Please run: gh auth login" >&2; exit 1; }

repo=${1:-}
if [[ -z "${repo}" ]]; then
  echo "Usage: $0 <owner/repo> [issues.tsv path]" >&2
  exit 1
fi

file=${2:-issues/issues.tsv}
if [[ ! -f "$file" ]]; then
  echo "Issues file not found: $file" >&2
  exit 1
fi

echo "Creating labels..."
"$(dirname "$0")/create_labels.sh" "$repo"

echo "Creating milestones..."
"$(dirname "$0")/create_milestones.sh" "$repo"

echo "Creating issues from $file ..."
tail -n +2 "$file" | while IFS=$'\t' read -r title labels milestone body; do
  echo "- $title"
  # Create issue
  number=$(gh issue create --repo "$repo" --title "$title" --body "$body" --label "$labels" --milestone "$milestone" --json number -q .number)
  echo "  -> #$number"
done

echo "Done."

