# Design: add-openspec-command-sop

## Context

OpenSpec has two command surfaces:

- Terminal commands, such as `openspec list`, `openspec validate`, and `openspec archive`.
- AI assistant workflows, such as `/opsx:propose` or Codex skill-style invocations.

The guardrails importer currently copies only the folder structure, templates, docs, and validation script. Imported projects need a visible local entry point that explains and delegates OpenSpec usage.

## Approach

Add `scripts/openspec.sh` as a small POSIX shell helper.

The helper will:

- Print an overview when called with no arguments or `help`.
- Print the existing-codebase workflow when called with `brownfield`.
- Print the standard operating procedure when called with `sop`.
- Run the guardrails validation and official OpenSpec validation when called with `validate`.
- Delegate common commands such as `list`, `show`, `view`, `archive`, `new`, `status`, `init`, `update`, `config`, and `doctor` to the official `openspec` CLI if installed.
- Fail clearly when a delegated command needs the official CLI but it is unavailable.

## Alternatives Considered

- Vendor the official OpenSpec CLI: rejected because the guardrails repo should remain lightweight and dependency-free.
- Add only documentation: rejected because the project should expose an executable command surface.
- Run `openspec init` during import: deferred because it can be interactive and tool-specific, while the importer should remain predictable.

## Risks

- The helper may drift from official OpenSpec command names. Keep it thin and delegate whenever possible.
- Codex may surface skills differently from slash-command tools. The docs should name that distinction instead of pretending one syntax works everywhere.

## Validation

- Run `./scripts/validate.sh` in the guardrails repo.
- Import into an existing project with `--force` when refreshing known guardrails files.
- Run `./scripts/openspec.sh help`, `./scripts/openspec.sh brownfield`, and `./scripts/openspec.sh validate` in the imported project.
