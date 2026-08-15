# Engineering Guardrails Specification

## Requirements

### Requirement: Spec Before Implementation

Projects SHALL define or update a spec before non-trivial implementation work begins.

#### Scenario: Feature changes behavior

- **WHEN** a change adds or modifies product, API, data, model, security, or deployment behavior
- **THEN** the project SHALL create a proposal, spec delta, and task list before implementation

#### Scenario: Small maintenance change

- **WHEN** a change is limited to typo fixes, formatting, comments, or isolated test maintenance
- **THEN** the project MAY skip the full spec workflow

### Requirement: Review Before Implementation

Projects SHALL review the proposed change artifacts before implementation when the change affects architecture, data contracts, security, deployment, or user-facing behavior.

#### Scenario: Architecture-impacting change

- **WHEN** a change introduces new infrastructure, dependency, integration, persistence, or public interface behavior
- **THEN** the agent SHALL stop after preparing proposal, design, and tasks for human review

### Requirement: Concise Documentation

Projects SHALL keep documentation short, intentional, and organized by purpose.

#### Scenario: Deployment instructions are added

- **WHEN** deployment instructions are needed
- **THEN** they SHALL live in a focused deployment document or page instead of being mixed into unrelated project overview content

### Requirement: Reuse Existing Patterns

Projects SHALL prefer local patterns, existing utilities, and shared templates before adding new abstractions.

#### Scenario: Similar implementation exists

- **WHEN** a similar workflow, component, script, or helper already exists
- **THEN** the implementation SHALL reuse or extend it unless the spec documents why that is inappropriate

### Requirement: Validation Is Required

Projects SHALL document validation for every non-trivial change.

#### Scenario: Change is implemented

- **WHEN** implementation is complete
- **THEN** the final response or change summary SHALL include the validation command, result, or reason validation could not be run

