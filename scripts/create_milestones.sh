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

declare -A titles
titles[M1]="M1: Student Journey Cleanup"
titles[M2]="M2: AI DB & RLS"
titles[M3]="M3: AI API & Web Shell"
titles[M4]="M4: Embeddings & RAG"
titles[M5]="M5: Chat Gateway & Modelfiles"

for key in M1 M2 M3 M4 M5; do
  t=${titles[$key]}
  gh milestone create "$t" --repo "$repo" 2>/dev/null || echo "Milestone exists: $t"
done

echo "Milestones ensured for $repo"

