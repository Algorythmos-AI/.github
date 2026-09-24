# Contributing to Algorythmos repositories

This is the organisation default. If a repository has its own `CONTRIBUTING.md`, follow that instead.

## Branches

Each repository uses one of two models. Its default branch tells you which.

| Default branch | Model | Flow |
|---|---|---|
| `integration` | Staged releases | Branch from `integration` → pull request into `integration` (staging) → release pull request into `main` (production). |
| `main` | Trunk | Branch from `main` → pull request into `main`. Releases are cut from tags. |

Never push directly to `main` or `integration`. Rulesets block it.

## Pull requests

- Keep each pull request to one change, and describe what changed and why.
- Name branches `<type>/<short-description>`, e.g. `fix/login-rate-limit` or `feat/export-pdf`.
- Write commit messages in the imperative mood: "Add export", not "Added export".
- CI must pass before merge. Don't disable or skip a check to get green; fix the cause.
- Add or update tests for behaviour you change.

## Secrets

Never commit credentials, tokens, keys or personal data. Push protection is enabled and will block a
push that contains a secret. If that happens, remove the secret from your commits and **rotate it**.
Treat it as exposed. Only bypass the block for a confirmed false positive, and give the reason.

## Licence

Unless a repository states otherwise, its contents are proprietary to Algorythmos Pty Ltd and
contributions are made under that ownership.
