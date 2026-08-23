# Proposal: add-project-import-script

## Why

Projects currently need to copy the SDD guardrails files manually. That makes adoption inconsistent and increases the chance that a project misses `AGENTS.md`, OpenSpec folders, templates, docs, or validation scripts.

An import script would make the framework easy to bootstrap into application repos while preserving existing project files.

## What Changes

- Add a script that imports this guardrails framework into a target project directory.
- Copy the core files and folders needed to use SDD-based AI development:
  - `AGENTS.md`
  - `openspec/README.md`
  - `openspec/specs/engineering-guardrails/spec.md`
  - `openspec/changes/.gitkeep`
  - `templates/`
  - `docs/`
  - `scripts/import-guardrails.sh`
  - `scripts/validate.sh`
- Preserve target files by default and report conflicts instead of overwriting silently.
- Support an explicit overwrite or update mode for teams that want to refresh existing guardrails.
- Support a dry-run mode so users can preview changes before files are copied.
- Document usage in `README.md`.

## What Does Not Change

- The script does not install dependencies.
- The script does not modify application source code.
- The script does not create commits, branches, or pull requests.
- The script does not archive or apply pending OpenSpec changes automatically.

## Review Needed

- [ ] Requirements are clear.
- [ ] Scope is bounded.
- [ ] Risks are understood.
- [ ] Implementation may begin.
