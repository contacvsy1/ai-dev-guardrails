# OpenSpec Workspace

This folder follows the OpenSpec idea of separating current truth from proposed change.

- `specs/`: accepted, current source-of-truth requirements.
- `changes/`: proposed or active changes.

Use one folder per change:

```text
openspec/changes/<change-name>/
  proposal.md
  design.md
  tasks.md
  specs/<area>/spec.md
```

When the change is complete and reviewed, archive the change and merge accepted requirements into `openspec/specs/`.

