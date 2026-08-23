# Proposal: expand-sdd-ai-guardrails

## Why

The current guardrails define the basic spec-before-implementation workflow, but they do not yet capture several best practices needed for reliable specification-driven development with AI agents. Projects need clearer expectations for context gathering, acceptance criteria, traceability, risk handling, generated-code review, validation evidence, and human approval gates.

Without these rules, AI-assisted work can drift from the requested behavior, implement unreviewed architecture or security changes, or produce changes that are difficult to validate later.

## What Changes

- Add explicit SDD requirements for problem framing, constraints, non-goals, acceptance scenarios, and traceability from requirements to tasks and validation.
- Add AI-agent context hygiene rules for reading local docs/specs first, preserving user changes, and recording assumptions when requirements are incomplete.
- Add risk classification and review gates for security, data, architecture, deployment, dependencies, migrations, and public interfaces.
- Add implementation guardrails for generated code, including small diffs, tests for behavioral changes, and no unapproved dependency or contract changes.
- Add validation evidence requirements so every completed non-trivial change documents what was checked and what remains risky.
- Update README, AGENTS rules, docs, templates, and validation checks after review.

## What Does Not Change

- The repository remains lightweight and plain-text first.
- OpenSpec remains the organizing workflow for proposed and accepted requirements.
- Small typo, formatting, comment, and isolated test-maintenance changes may still skip the full workflow.
- This change does not introduce runtime dependencies or a new documentation framework.

## Review Needed

- [ ] Requirements are clear.
- [ ] Scope is bounded.
- [ ] Risks are understood.
- [ ] Implementation may begin.
