# Algorythmos-AI/.github

Organisation-wide defaults for every Algorythmos repository.

| Path | What it is |
|---|---|
| `profile/README.md` | The public homepage at [github.com/Algorythmos-AI](https://github.com/Algorythmos-AI) |
| `CONTRIBUTING.md` | Default contribution rules for repositories that don't have their own |
| `SECURITY.md` | Default vulnerability-reporting policy |
| `.github/pull_request_template.md` | Default pull request template |
| `.github/ISSUE_TEMPLATE/` | Default issue forms |
| `.github/workflows/security.yml` | Reusable workflow: gitleaks secret scan, optional Semgrep |
| `labels.json` + `scripts/sync-labels.sh` | The shared label set, synced to every repository (adds and updates, never deletes) |
| `templates/dependabot.yml` | Dependency-update policy to copy into a repository |

A repository's own copy of any of these files takes precedence over the default here.

## Using the reusable security workflow

```yaml
# .github/workflows/security.yml in a repository
name: Security
on:
  pull_request: {}
  push: { branches: [integration, main] }
permissions: { contents: read }
jobs:
  security:
    uses: Algorythmos-AI/.github/.github/workflows/security.yml@main
    with: { semgrep: true }   # false for repositories without JavaScript/TypeScript
```

The check reports as `security / Secret scan`. If a ruleset requires a check under another name,
update the required check in the same change, or pull requests will wait for a check that never runs.
Switch one repository at a time.

## Syncing labels

```bash
scripts/sync-labels.sh --dry-run   # show what would change
scripts/sync-labels.sh             # all non-archived repositories
scripts/sync-labels.sh my-repo     # one repository
```

Everything in this repository is public. Never add internal repository names, client details,
addresses or credentials.
