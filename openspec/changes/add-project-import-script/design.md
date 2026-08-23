# Design: add-project-import-script

## Context

This repository is intended to be copied or imported into other application repos, but no script currently exists to do that. The existing tooling is plain shell via `scripts/validate.sh`, so the importer should follow the same lightweight pattern.

## Approach

Add `scripts/import-guardrails.sh` as a POSIX-compatible shell script.

The script should:

- Resolve the guardrails repository root from its own location.
- Require a target project path.
- Create missing target directories.
- Copy the approved guardrail files and folders.
- Refuse to overwrite existing files by default.
- Print conflicts and next steps when target files already exist.
- Provide `--dry-run` to preview actions.
- Provide `--force` to overwrite existing files intentionally.

Example usage:

```sh
./scripts/import-guardrails.sh /path/to/project --dry-run
./scripts/import-guardrails.sh /path/to/project
./scripts/import-guardrails.sh /path/to/project --force
```

## Alternatives Considered

- Provide only README copy instructions: rejected because manual setup is easy to get wrong.
- Write the importer in Python or Node.js: rejected because shell is enough and avoids new dependencies.
- Automatically merge with existing target specs: rejected for the first version because merge behavior can corrupt project-specific guardrails.

## Risks

- Overwriting existing project rules could remove local conventions if `--force` is used carelessly.
- Copying docs into projects that already have docs could create duplicate documentation.
- Imported guardrails could drift from this source repo over time without a refresh process.

## Validation

Run:

```sh
./scripts/validate.sh
```

Also smoke test the importer against a temporary directory:

```sh
tmpdir="$(mktemp -d)"
./scripts/import-guardrails.sh "$tmpdir" --dry-run
./scripts/import-guardrails.sh "$tmpdir"
./scripts/import-guardrails.sh "$tmpdir"
```

The second import should report conflicts and avoid overwriting by default.
