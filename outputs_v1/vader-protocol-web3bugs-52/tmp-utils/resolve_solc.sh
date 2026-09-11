#!/bin/bash
# resolve_solc.sh — Resolves a semantic solc version to an absolute binary path
# Usage: bash scripts/utils/resolve_solc.sh 0.8.9
# Output: /home/<user>/.solc-select/artifacts/solc-0.8.9/solc-0.8.9

set -euo pipefail

VERSION="${1:-}"

if [ -z "$VERSION" ]; then
    echo "ERROR: No solc version provided." >&2
    echo "Usage: bash scripts/utils/resolve_solc.sh <version>" >&2
    echo "Example: bash scripts/utils/resolve_solc.sh 0.8.9" >&2
    exit 1
fi

# Normalize: remove leading "solc" prefix if present (e.g., "solc8.9" -> "0.8.9")
VERSION=$(echo "$VERSION" | sed 's/^solc//' | sed 's/^v//')
# If version doesn't start with 0., prepend it (e.g., "8.9" -> "0.8.9")
if [[ ! "$VERSION" =~ ^0\. ]]; then
    VERSION="0.${VERSION}"
fi

SOLC_DIR="$HOME/.solc-select/artifacts/solc-${VERSION}"
SOLC_PATH="${SOLC_DIR}/solc-${VERSION}"

if [ -f "$SOLC_PATH" ]; then
    echo "$SOLC_PATH"
    exit 0
fi

# Try to install via solc-select
echo "INFO: solc-${VERSION} not found. Installing via solc-select..." >&2
if command -v solc-select &>/dev/null; then
    solc-select install "$VERSION" >&2 2>&1 || true
    solc-select use "$VERSION" >&2 2>&1 || true
    if [ -f "$SOLC_PATH" ]; then
        echo "$SOLC_PATH"
        exit 0
    fi
fi

# Try certora venv — search relative to script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! REPO_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null)"; then
    REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
fi
CERTORA_VENV="$REPO_ROOT/certora_venv/bin/activate"
if [ -f "$CERTORA_VENV" ]; then
    source "$CERTORA_VENV"
    solc-select install "$VERSION" >&2 2>&1 || true
    solc-select use "$VERSION" >&2 2>&1 || true
    if [ -f "$SOLC_PATH" ]; then
        echo "$SOLC_PATH"
        exit 0
    fi
fi

echo "ERROR: Could not resolve solc-${VERSION}. Path checked: ${SOLC_PATH}" >&2
exit 1
