# My LeetCode Solutions

LeetCode solutions in Go.

## Architecture

```text
solutions/
  go/
    <problem-id>-<slug>/
      solution.go
```

Example:

```text
solutions/go/3289-two-sneaky-numbers-of-digitville/solution.go
```

Naming convention:

- Folder: `<problem-id>-<slug>`
- File: `solution.go`

## Progress

<!-- index:start -->

Solved: 0

| ID  | Title            | Link |
| --- | ---------------- | ---- |
| -   | No solutions yet | -    |

<!-- index:end -->

## Quick setup

1. Open the project in the devcontainer.
2. Install git hooks:

```bash
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

3. Run checks manually:

```bash
pre-commit run --all-files
```

What runs on `pre-commit`:

- EditorConfig compliance check
- Go formatting with `gofmt`
- Go tests and `golangci-lint`

## Add a solution

Fast option (recommended):

```powershell
./scripts/new-problem.ps1 -Id 1 -Slug two-sum
```

```bash
./scripts/new-problem.sh 1 two-sum
```

Manual option:

1. Create `solutions/go/<id>-<slug>/`
2. Add `solution.go`
3. Optional: add `solution_test.go` and `notes.md`
4. Update the README index:

```powershell
./scripts/update-readme-index.ps1
```

```bash
./scripts/update-readme-index.sh
```

Template is available in `templates/problem/`.

## Commit message rule

Required format:

```text
type(scope): message
```

Examples:

- feat(go): add solution for 3289
- fix(readme): update setup steps

Allowed types: feat, fix, docs, style, refactor, perf, test, build, ci, chore,
revert.

Commit message validation uses conventional-pre-commit (the `commit-msg` hook).
