#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage: import-guardrails.sh [--dry-run] [--force] <target-project>

Import the AI Development Guardrails framework into a project.

Options:
  --dry-run   Print planned file operations without writing files.
  --force     Overwrite existing target files.
  -h, --help  Show this help text.
EOF
}

dry_run=false
force=false
target=

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run)
      dry_run=true
      ;;
    --force)
      force=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      if [ -n "$target" ]; then
        echo "Only one target project path may be provided." >&2
        usage >&2
        exit 2
      fi
      target=$1
      ;;
  esac
  shift
done

if [ -z "$target" ]; then
  echo "Missing target project path." >&2
  usage >&2
  exit 2
fi

if [ ! -d "$target" ]; then
  echo "Target project path is not a directory: $target" >&2
  exit 2
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
target_root=$(CDPATH= cd -- "$target" && pwd)

manifest=$(mktemp "${TMPDIR:-/tmp}/guardrails-import.XXXXXX")
trap 'rm -f "$manifest"' EXIT HUP INT TERM

cat > "$manifest" <<'EOF'
AGENTS.md
openspec/README.md
openspec/specs/engineering-guardrails/spec.md
openspec/changes/.gitkeep
scripts/import-guardrails.sh
scripts/openspec.sh
scripts/validate.sh
EOF

find "$repo_root/templates" "$repo_root/docs" -type f | while IFS= read -r source_file; do
  rel=${source_file#"$repo_root/"}
  printf '%s\n' "$rel" >> "$manifest"
done

conflicts=0
copied=0

while IFS= read -r rel; do
  source_file=$repo_root/$rel
  target_file=$target_root/$rel

  if [ ! -f "$source_file" ]; then
    echo "Missing source file: $rel" >&2
    exit 1
  fi

  if [ -e "$target_file" ] && [ "$force" != true ]; then
    echo "conflict: $rel already exists"
    conflicts=$((conflicts + 1))
    continue
  fi

  if [ "$dry_run" = true ]; then
    if [ -e "$target_file" ]; then
      echo "would overwrite: $rel"
    else
      echo "would copy: $rel"
    fi
  else
    mkdir -p "$(dirname -- "$target_file")"
    cp -p "$source_file" "$target_file"
    echo "copied: $rel"
  fi

  copied=$((copied + 1))
done < "$manifest"

if [ "$conflicts" -gt 0 ]; then
  echo
  echo "Import completed with $conflicts conflict(s). Re-run with --force to overwrite existing files."
  exit 1
fi

if [ "$dry_run" = true ]; then
  echo
  echo "Dry run complete. $copied file(s) can be imported."
else
  echo
  echo "Import complete. $copied file(s) imported into $target_root."
fi
