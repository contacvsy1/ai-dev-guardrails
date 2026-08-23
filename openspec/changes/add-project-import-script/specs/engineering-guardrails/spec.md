# Engineering Guardrails Specification Delta

## ADDED Requirements

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
