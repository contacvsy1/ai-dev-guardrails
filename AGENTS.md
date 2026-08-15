# AI Agent Rules

These rules apply to any AI coding agent working in a project that imports this guardrails repo.

## Operating Principles

- Prefer existing project patterns over new abstractions.
- Keep changes small, reviewable, and scoped to the request.
- Do not implement non-trivial changes until a proposal, spec delta, and task list exist.
- Ask for review before implementation when requirements, data contracts, security, deployment, or architecture are affected.
- Avoid noisy documentation. Update only docs that help users, operators, reviewers, or future maintainers.
- Reuse shared templates and existing docs before creating new documents.
- Do not add dependencies without documenting the reason, alternative considered, and validation impact.

## Spec Workflow

For non-trivial work:

1. Create `openspec/changes/<change-name>/proposal.md`.
2. Create or update `openspec/changes/<change-name>/specs/<area>/spec.md`.
3. Create `openspec/changes/<change-name>/design.md` when implementation choices matter.
4. Create `openspec/changes/<change-name>/tasks.md`.
5. Stop for review before implementation unless the user explicitly approved implementation.
6. Implement only the approved task list.
7. Update source specs after the change is accepted.

Small typo fixes, comments, formatting, or test-only maintenance may skip the full workflow.

## Coding Standards

- Write clear, direct code with descriptive names.
- Keep functions focused and easy to test.
- Prefer boring, stable dependencies.
- Avoid cleverness when a simple implementation is enough.
- Keep generated files, build artifacts, logs, and local outputs out of source control unless intentionally versioned.
- Include tests for behavioral changes.
- Run the smallest meaningful validation command before finalizing.

## Documentation Standards

- README files should be crisp and plain text.
- Use `docs/index.html` as the parent documentation page.
- Use focused subpages for architecture, workflow, deployment, debugging, and project-specific standards.
- Do not mix deployment instructions with product overview unless required for first-run setup.
- Do not add decorative styles, marketing sections, or unrelated screenshots.

## Review Checklist

- The spec says what changes and what does not change.
- Acceptance scenarios are concrete.
- Tasks map back to requirements.
- Risks and rollback notes are present for deployment-impacting work.
- Validation is documented and repeatable.

