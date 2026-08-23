# Engineering Guardrails Specification Delta

## ADDED Requirements

### Requirement: SDD Problem Framing

Projects SHALL frame non-trivial AI-assisted work with a clear problem statement, goals, non-goals, constraints, and assumptions before implementation begins.

#### Scenario: Requirements are incomplete

- **WHEN** the requested change lacks necessary product, technical, security, data, or deployment detail
- **THEN** the agent SHALL either ask for clarification or document a conservative assumption in the proposal before implementation

#### Scenario: Scope could expand

- **WHEN** related improvements are discovered during planning
- **THEN** the proposal SHALL identify what is in scope and what is explicitly out of scope

### Requirement: Acceptance Scenarios Drive Implementation

Projects SHALL define concrete acceptance scenarios for non-trivial behavior changes and use those scenarios to guide tasks and validation.

#### Scenario: Behavior changes

- **WHEN** a change modifies user-visible, API, data, model, security, deployment, or operational behavior
- **THEN** the spec delta SHALL include scenario-based acceptance criteria before implementation

#### Scenario: Implementation is complete

- **WHEN** the agent summarizes the change
- **THEN** the summary SHALL describe validation against the acceptance scenarios or explain why validation could not be completed

### Requirement: Requirement-To-Task Traceability

Projects SHALL keep tasks traceable to the approved requirements for non-trivial changes.

#### Scenario: Task list is created

- **WHEN** tasks are written for a change
- **THEN** each task SHALL map to a requirement, acceptance scenario, validation step, or review obligation

#### Scenario: New work is discovered

- **WHEN** implementation reveals work outside the approved task list
- **THEN** the agent SHALL update the proposal/tasks and pause for review if the new work affects requirements, data contracts, security, deployment, or architecture

### Requirement: AI Context Hygiene

AI agents SHALL gather and preserve relevant project context before making non-trivial changes.

#### Scenario: Starting work in a repository

- **WHEN** an agent begins non-trivial work
- **THEN** it SHALL read the applicable project rules, source specs, relevant docs, and nearby implementation patterns before editing

#### Scenario: Existing local changes are present

- **WHEN** unrelated local changes exist
- **THEN** the agent SHALL preserve them and avoid reverting or rewriting user work

#### Scenario: External facts affect the change

- **WHEN** a decision depends on current external behavior, pricing, laws, APIs, standards, or service documentation
- **THEN** the agent SHALL verify the current source before relying on it

### Requirement: Risk-Based Review Gates

Projects SHALL classify non-trivial changes by risk and require human review before implementing high-impact changes.

#### Scenario: High-impact change is proposed

- **WHEN** a change affects security, privacy, permissions, data contracts, migrations, infrastructure, deployment, public APIs, authentication, authorization, billing, dependencies, or irreversible operations
- **THEN** the agent SHALL prepare proposal, spec delta, design notes, and tasks, then stop for human review before implementation

#### Scenario: Dependency is proposed

- **WHEN** a new dependency is needed
- **THEN** the design SHALL document the reason, alternatives considered, validation impact, and rollback plan

### Requirement: Generated Code Review

Projects SHALL treat AI-generated code as untrusted until it is reviewed, tested, and validated against the spec.

#### Scenario: Code is generated or modified

- **WHEN** an agent writes implementation code
- **THEN** the change SHALL remain small, reviewable, consistent with local patterns, and covered by the smallest meaningful validation

#### Scenario: Security-sensitive code is generated

- **WHEN** generated code touches authentication, authorization, secrets, sandboxing, cryptography, permissions, or user data
- **THEN** it SHALL receive explicit human review before merge or release

### Requirement: Validation Evidence

Projects SHALL record repeatable validation evidence for every non-trivial change.

#### Scenario: Validation succeeds

- **WHEN** validation is run
- **THEN** the final summary or change notes SHALL include the command or check name and result

#### Scenario: Validation cannot be run

- **WHEN** validation cannot be completed
- **THEN** the final summary or change notes SHALL explain the blocker and the residual risk

### Requirement: Rollback Planning

Deployment-impacting changes SHALL include a rollback or mitigation note before implementation.

#### Scenario: Deployment behavior changes

- **WHEN** a change affects release, migration, infrastructure, configuration, or runtime operations
- **THEN** the design or deployment plan SHALL describe rollback, mitigation, or recovery steps
