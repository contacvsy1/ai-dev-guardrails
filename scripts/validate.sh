#!/usr/bin/env sh
set -eu

test -f AGENTS.md
test -f docs/index.html
test -f openspec/specs/engineering-guardrails/spec.md
test -x scripts/import-guardrails.sh

echo "Validation passed."
