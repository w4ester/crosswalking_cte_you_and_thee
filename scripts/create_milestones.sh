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

milestones=(
  "M1: Student Journey Cleanup"
  "M2: AI DB & RLS"
  "M3: AI API & Web Shell"
  "M4: Embeddings & RAG"
  "M5: Chat Gateway & Modelfiles"
)

for t in "${milestones[@]}"; do
  gh milestone create "$t" --repo "$repo" 2>/dev/null || echo "Milestone exists: $t"
done

echo "Milestones ensured for $repo"
