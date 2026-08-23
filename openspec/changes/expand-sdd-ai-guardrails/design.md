# Design: expand-sdd-ai-guardrails

## Context

This repository is a reusable guardrails package for AI-assisted development. It currently contains:

- `AGENTS.md` for agent operating rules.
- `openspec/specs/engineering-guardrails/spec.md` as the accepted source-of-truth spec.
- `templates/` for proposal, design, tasks, and deployment plans.
- `docs/` as plain HTML user-facing documentation.
- `scripts/validate.sh` for minimal repository checks.

The existing pattern is concise, static documentation with OpenSpec-style change folders. The implementation should preserve that shape and avoid new tooling unless a simple validation enhancement clearly improves correctness.

## Approach

Update the accepted guardrails through a focused documentation/spec change:

1. Expand the engineering guardrails spec with SDD and AI-agent requirements.
2. Update `AGENTS.md` so imported projects get the same operational rules.
3. Update templates so new changes capture assumptions, non-goals, acceptance scenarios, traceability, risk, rollback, and validation evidence.
4. Update docs pages with the minimum useful guidance for humans adopting the workflow.
5. Extend `scripts/validate.sh` with simple file/content checks that ensure the key guardrail documents exist.

## Alternatives Considered

- Add a full CLI validator: rejected for this change because it would add complexity and likely dependencies before the content model is stable.
- Add extensive policy documents: rejected because the repo intentionally favors crisp, reusable guidance.
- Split SDD and AI rules into separate specs: deferred unless the combined engineering guardrails spec becomes hard to scan.

## Risks

- The guardrails could become too verbose and harder for agents to follow.
- Rules could over-constrain small changes if exceptions are not clear.
- Validation checks could become brittle if they assert exact prose instead of stable document structure.

## Validation

Run:

```sh
./scripts/validate.sh
```

Manual review should confirm:

- The spec says what changes and what does not change.
- Acceptance scenarios are concrete.
- Tasks map back to requirements.
- AI-specific rules are actionable rather than aspirational.
- The docs remain concise and reusable across projects.
