#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
local_openspec=$repo_root/node_modules/.bin/openspec

openspec_cmd() {
  if [ -x "$local_openspec" ]; then
    OPENSPEC_TELEMETRY=${OPENSPEC_TELEMETRY:-0} "$local_openspec" "$@"
    return $?
  fi

  OPENSPEC_TELEMETRY=${OPENSPEC_TELEMETRY:-0} openspec "$@"
}

usage() {
  cat <<'EOF'
OpenSpec project helper

Usage:
  ./scripts/openspec.sh help
  ./scripts/openspec.sh brownfield
  ./scripts/openspec.sh sop
  ./scripts/openspec.sh validate [args...]
  ./scripts/openspec.sh <openspec-command> [args...]

Project-local SOP commands:
  help        Show command surfaces and quick workflow.
  brownfield  Show the standard workflow for an existing codebase.
  sop         Show the standard operating procedure for changes.

Delegated official OpenSpec CLI commands:
  init, update, config, list, show, view, validate, archive,
  new, status, context, doctor

AI assistant commands:
  Claude Code: /opsx:explore, /opsx:propose, /opsx:apply, /opsx:archive
  Cursor/Windsurf/Copilot IDE: /opsx-explore, /opsx-propose, /opsx-apply, /opsx-archive
  Codex: use installed OpenSpec skills, typically $openspec-explore,
         $openspec-propose, $openspec-apply-change, $openspec-archive

Notes:
  - Terminal commands run in your shell.
  - AI assistant commands run in the assistant chat, not the terminal.
  - This helper uses local node_modules first, then a global `openspec` command.
EOF
}

brownfield() {
  cat <<'EOF'
Brownfield OpenSpec SOP

Use OpenSpec delta-first. Do not document the whole existing app up front.
Pick a small real change, write the spec delta for the slice it touches,
implement from the approved task list, then archive accepted requirements.

Recommended rhythm:
  1. Explore the area you will touch.
     AI chat: /opsx:explore
     Codex:   $openspec-explore

  2. Propose one concrete change.
     AI chat: /opsx:propose add-api-rate-limiting
     Codex:   $openspec-propose add-api-rate-limiting

  3. Review:
     openspec/changes/<change-name>/proposal.md
     openspec/changes/<change-name>/design.md
     openspec/changes/<change-name>/tasks.md
     openspec/changes/<change-name>/specs/<area>/spec.md

  4. Apply after review.
     AI chat: /opsx:apply
     Codex:   $openspec-apply-change

  5. Validate and archive.
     Terminal: ./scripts/openspec.sh validate
     AI chat:  /opsx:archive
     Codex:    $openspec-archive

Useful terminal checks:
  ./scripts/openspec.sh list
  ./scripts/openspec.sh list --specs
  ./scripts/openspec.sh show <change-or-spec>
  ./scripts/openspec.sh status <change-name>
EOF
}

sop() {
  cat <<'EOF'
Standard Operating Procedure

For non-trivial work:
  1. Create or update an OpenSpec change.
  2. Keep proposal, spec delta, design notes, and tasks aligned.
  3. Stop for review before implementation unless implementation is explicitly approved.
  4. Implement only the approved task list.
  5. Run the smallest meaningful validation.
  6. Archive the change after acceptance so openspec/specs becomes current truth.

Project files:
  Current specs:   openspec/specs/
  Active changes:  openspec/changes/
  Templates:       templates/
  Guardrails:      AGENTS.md
EOF
}

need_openspec() {
  if [ -x "$local_openspec" ] || command -v openspec >/dev/null 2>&1; then
    return 0
  fi

  cat >&2 <<'EOF'
The official `openspec` CLI was not found on PATH.

Install or invoke OpenSpec with your package manager, then re-run this command.
Common options:
  npm install                         # in this guardrails repo
  npm install -D @fission-ai/openspec # in another project
  npm install -g @fission-ai/openspec
  npx @fission-ai/openspec@latest <command>

This project still contains the OpenSpec folders and SDD guardrails.
EOF
  return 127
}

run_validate() {
  if [ -x "$repo_root/scripts/validate.sh" ]; then
    "$repo_root/scripts/validate.sh"
  fi

  if [ -x "$local_openspec" ] || command -v openspec >/dev/null 2>&1; then
    openspec_cmd validate "$@"
  else
    echo 'Skipped official OpenSpec validation: `openspec` is not installed.'
  fi
}

cmd=${1:-help}
if [ "$#" -gt 0 ]; then
  shift
fi

case "$cmd" in
  help|-h|--help)
    usage
    ;;
  brownfield|existing)
    brownfield
    ;;
  sop|workflow)
    sop
    ;;
  validate)
    run_validate "$@"
    ;;
  init|update|config|list|show|view|archive|new|status|context|doctor)
    need_openspec
    openspec_cmd "$cmd" "$@"
    ;;
  *)
    echo "Unknown command: $cmd" >&2
    echo >&2
    usage >&2
    exit 2
    ;;
esac
