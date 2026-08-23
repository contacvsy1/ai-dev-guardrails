# Engineering Guardrails Specification Delta

## ADDED Requirements

### Requirement: OpenSpec Command SOP

The guardrails framework SHALL provide a project-local command helper that makes OpenSpec usage visible after import.

#### Scenario: User asks how to work in a brownfield project

- **WHEN** a user runs the helper with the `brownfield` command
- **THEN** it SHALL print the standard brownfield workflow for using OpenSpec on small real changes

#### Scenario: User asks for available commands

- **WHEN** a user runs the helper with no arguments or `help`
- **THEN** it SHALL print terminal commands, AI assistant command forms, and the recommended day-to-day workflow

#### Scenario: Official OpenSpec CLI is installed

- **WHEN** a user runs a helper command that maps to the official `openspec` CLI
- **THEN** the helper SHALL delegate to the official CLI

#### Scenario: Official OpenSpec CLI is missing

- **WHEN** a user runs a delegated command and `openspec` is not available
- **THEN** the helper SHALL explain that the official CLI must be installed or run from the user's package runner

### Requirement: Import OpenSpec Helper

The guardrails importer SHALL copy the OpenSpec command helper into target projects.

#### Scenario: Import into a target project

- **WHEN** a user runs the guardrails import script
- **THEN** the importer SHALL include `scripts/openspec.sh` in the imported files

### Requirement: Validate OpenSpec Helper

The validation script SHALL check that the OpenSpec helper is available.

#### Scenario: Validate imported guardrails

- **WHEN** a user runs `scripts/validate.sh`
- **THEN** it SHALL confirm that `scripts/openspec.sh` exists and is executable
