#!/usr/bin/env sh
set -eu

test -f README.md
test -f AGENTS.md
test -f docs/index.html
test -f openspec/specs/engineering-guardrails/spec.md

echo "Validation passed."

