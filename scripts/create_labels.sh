#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI not found. Install from https://cli.github.com/" >&2
  exit 1
fi

gh auth status || { echo "Please run: gh auth login" >&2; exit 1; }

repo=${1:-}
if [[ -z "${repo}" ]]; then
  echo "Usage: $0 <owner/repo>" >&2
  exit 1
fi

labels=(
  "area:journey#0366d6#Student Journey / UX"
  "area:portfolio#0e8a16#Portfolio / Plan / Resume"
  "area:ai-db#5319e7#AI Platform / Database"
  "area:ai-api#5319e7#AI Platform / API"
  "area:ai-web#5319e7#AI Platform / Web"
  "area:rag#5319e7#RAG / Embeddings / Vector"
  "type:feature#1d76db#Feature"
  "type:chore#d4c5f9#Chore"
  "type:docs#0052cc#Docs"
  "priority:P1#d73a4a#High"
  "priority:P2#fbca04#Medium"
  "priority:P3#c0c0c0#Low"
)

for l in "${labels[@]}"; do
  name=${l%%#*}
  rest=${l#*#}
  color=${rest%%#*}
  desc=${rest#*#}
  gh label create "$name" --repo "$repo" --color "$color" --description "$desc" 2>/dev/null || gh label edit "$name" --repo "$repo" --color "$color" --description "$desc"
done

echo "Labels ensured for $repo"
