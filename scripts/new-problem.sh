#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: ./scripts/new-problem.sh <id> <slug>" >&2
  exit 1
fi

ID="$1"
SLUG="$2"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

clean_slug="$(echo "$SLUG" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9-]+/-/g; s/-+/-/g; s/^-+//; s/-+$//')"
folder_name="$ID-$clean_slug"
target_dir="$REPO_ROOT/solutions/go/$folder_name"
template_dir="$REPO_ROOT/templates/problem"

if [[ -d "$target_dir" ]]; then
  echo "Problem folder already exists: $target_dir" >&2
  exit 1
fi

mkdir -p "$target_dir"
cp "$template_dir/solution.go" "$target_dir/solution.go"
cp "$template_dir/solution_test.go" "$target_dir/solution_test.go"
cp "$template_dir/notes.md" "$target_dir/notes.md"

"$REPO_ROOT/scripts/update-readme-index.sh" "$REPO_ROOT"

echo "Created $folder_name"
