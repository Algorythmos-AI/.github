#!/usr/bin/env bash
# Make every Algorythmos-AI repository carry the labels in labels.json.
# Creates missing labels and updates colour/description of these names only; never deletes a
# repository's own labels. Usage: scripts/sync-labels.sh [--dry-run] [repo ...]
set -euo pipefail
cd "$(dirname "$0")/.."
ORG=Algorythmos-AI
dry=0; [[ "${1:-}" == "--dry-run" ]] && { dry=1; shift; }
repos=("$@")
if [[ ${#repos[@]} -eq 0 ]]; then
  while IFS= read -r r; do repos+=("$r"); done < <(gh repo list "$ORG" --limit 1000 --no-archived --json name --jq '.[].name')
fi
for r in "${repos[@]}"; do
  jq -c '.[]' labels.json | while read -r l; do
    name=$(jq -r .name <<<"$l"); color=$(jq -r .color <<<"$l"); desc=$(jq -r '.description // ""' <<<"$l")
    if [[ $dry -eq 1 ]]; then echo "would sync: $r :: $name"; continue; fi
    gh label create "$name" --repo "$ORG/$r" --color "$color" --description "$desc" --force >/dev/null
  done
  [[ $dry -eq 1 ]] || echo "labels synced: $r"
done
