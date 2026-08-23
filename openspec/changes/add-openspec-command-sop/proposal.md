# Proposal: add-openspec-command-sop

## Why

Imported projects currently receive OpenSpec-style folders but no visible operating entry point that explains how to invoke OpenSpec workflows.

This causes confusion between terminal commands, AI chat commands, and brownfield adoption. Teams need a project-local command and standard operating procedure after importing the guardrails.

## What Changes

- Add `scripts/openspec.sh` as a visible project-local command helper.
- Add a brownfield SOP command that explains how to use OpenSpec in existing codebases.
- Document terminal commands versus AI assistant commands.
- Include the helper in future guardrails imports.
- Validate that the helper exists and is executable.

## What Does Not Change

- The helper does not vendor or install the official OpenSpec CLI.
- The helper does not replace the official `openspec` command when it is installed.
- The importer still preserves existing target files unless `--force` is used.

## Review Needed

- [x] Requirements are clear.
- [x] Scope is bounded.
- [x] Risks are understood.
- [x] Implementation may begin.
