# Engineering Guardrails Specification

## Purpose

Define the operating rules for specification-driven, AI-assisted software development across projects that adopt these guardrails.

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

### Requirement: Project Import Script

The guardrails repository SHALL provide a script for importing the SDD framework into a target project.

#### Scenario: Import into a new project

- **WHEN** a user runs the import script with a target project path
- **THEN** the script SHALL copy the core guardrail files and directories into the target project

#### Scenario: Preview import

- **WHEN** a user runs the import script with dry-run mode
- **THEN** the script SHALL print the planned file operations without modifying the target project

#### Scenario: Target file already exists

- **WHEN** a target file already exists and overwrite mode is not enabled
- **THEN** the script SHALL report the conflict and preserve the existing file

#### Scenario: User requests overwrite

- **WHEN** a user runs the import script with explicit overwrite mode
- **THEN** the script MAY replace existing target files with the source guardrail files

#### Scenario: Target path is invalid

- **WHEN** the target path is missing or is not a directory
- **THEN** the script SHALL fail with a clear usage message
