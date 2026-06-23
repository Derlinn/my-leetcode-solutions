#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
README_PATH="$REPO_ROOT/README.md"
GO_ROOT="$REPO_ROOT/solutions/go"

if [[ ! -f "$README_PATH" ]]; then
  echo "README.md not found at $README_PATH" >&2
  exit 1
fi

if [[ ! -d "$GO_ROOT" ]]; then
  echo "solutions/go directory not found at $GO_ROOT" >&2
  exit 1
fi

rows=()
while IFS= read -r dir; do
  name="$(basename "$dir")"
  if [[ "$name" =~ ^([0-9]+)-(.+)$ ]]; then
    id="${BASH_REMATCH[1]}"
    slug="${BASH_REMATCH[2]}"
    title="$(echo "$slug" | tr '-' ' ' | awk '{for (i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) substr($i,2)} 1')"
    rows+=("| $id | $title | [solution.go](solutions/go/$name/solution.go) |")
  fi
done < <(find "$GO_ROOT" -mindepth 1 -maxdepth 1 -type d | sort)

if [[ ${#rows[@]} -eq 0 ]]; then
  rows+=("| - | No solutions yet | - |")
fi

count=$(find "$GO_ROOT" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')

block="Solved: $count

| ID | Title | Link |
| --- | --- | --- |
"
for row in "${rows[@]}"; do
  block+="$row
"
done

start_marker="<!-- index:start -->"
end_marker="<!-- index:end -->"

if ! grep -q "$start_marker" "$README_PATH" || ! grep -q "$end_marker" "$README_PATH"; then
  echo "README.md must contain $start_marker and $end_marker markers." >&2
  exit 1
fi

awk -v start="$start_marker" -v end="$end_marker" -v block="$block" '
  $0 == start {
    print start
    printf "%s", block
    in_block = 1
    next
  }
  $0 == end {
    in_block = 0
    print end
    next
  }
  !in_block { print }
' "$README_PATH" > "$README_PATH.tmp"

mv "$README_PATH.tmp" "$README_PATH"
echo "README index updated."
