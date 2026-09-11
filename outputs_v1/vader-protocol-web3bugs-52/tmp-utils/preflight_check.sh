#!/bin/bash
# preflight_check.sh — Pre-flight checks before certoraRun
# Usage: bash scripts/utils/preflight_check.sh <project_path> [solc_version]
# Output: JSON with resolved paths and status
#
# Checks:
# 1. CERTORAKEY is set
# 2. certoraRun is in PATH
# 3. solc binary is available for the given version
# 4. node_modules/@openzeppelin/contracts has .sol files
# 5. Creates remappings.txt if needed
# 6. Reports any blocking issues

set -euo pipefail

PROJECT_PATH="${1:-}"
SOLC_VERSION="${2:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$PROJECT_PATH" ]; then
    echo "ERROR: No project path provided." >&2
    echo "Usage: bash scripts/utils/preflight_check.sh <project_path> [solc_version]" >&2
    exit 1
fi

# Resolve to absolute path
PROJECT_PATH="$(cd "$PROJECT_PATH" 2>/dev/null && pwd)" || {
    echo "ERROR: Project path does not exist: $PROJECT_PATH" >&2
    exit 1
}

# Force reload environment variables from .env if present
# Check 1: Pipeline repo root .env (where CERTORAKEY typically lives)
if ! REPO_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null)"; then
    REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." 2>/dev/null && pwd)"
fi
if [ -f "$REPO_ROOT/.env" ]; then
    set -a
    source "$REPO_ROOT/.env"
    set +a
fi
# Check 2: Project-specific .env (overrides repo root if present)
if [ -f "$PROJECT_PATH/.env" ]; then
    set -a
    source "$PROJECT_PATH/.env"
    set +a
fi

ISSUES=()
WARNINGS=()

# ── Check 1: CERTORAKEY ──
if [ -z "${CERTORAKEY:-}" ]; then
    ISSUES+=("CERTORAKEY environment variable is not set")
elif [ "$CERTORAKEY" = "sua-chave-certora-aqui" ]; then
    ISSUES+=("CERTORAKEY is set to the default placeholder. Please provide a valid API key in .env")
elif [[ ${#CERTORAKEY} -lt 20 ]]; then
    ISSUES+=("CERTORAKEY does not match the expected minimum format.")
else
    echo "✅ CERTORAKEY is set" >&2
fi

# ── Check 2: certoraRun ──
CERTORA_PATH=""
if command -v certoraRun &>/dev/null; then
    CERTORA_PATH="$(which certoraRun)"
    echo "✅ certoraRun found at: $CERTORA_PATH" >&2
else
    # Try certora venv
    CERTORA_VENV="$REPO_ROOT/certora_venv/bin/activate"
    if [ -f "$CERTORA_VENV" ]; then
        source "$CERTORA_VENV"
        if command -v certoraRun &>/dev/null; then
            CERTORA_PATH="$(which certoraRun)"
            echo "✅ certoraRun found in venv at: $CERTORA_PATH" >&2
        else
            ISSUES+=("certoraRun not found even after activating certora_venv")
        fi
    else
        ISSUES+=("certoraRun not found in PATH and no certora_venv available")
    fi
fi

# ── Check 3: solc binary ──
SOLC_PATH=""
if [ -n "$SOLC_VERSION" ]; then
    SOLC_PATH=$(bash "$SCRIPT_DIR/resolve_solc.sh" "$SOLC_VERSION" 2>/dev/null) || true
    if [ -n "$SOLC_PATH" ] && [ -f "$SOLC_PATH" ]; then
        echo "✅ solc resolved to: $SOLC_PATH" >&2
    else
        ISSUES+=("Could not resolve solc for version: $SOLC_VERSION")
    fi
else
    WARNINGS+=("No solc version provided — skipping solc check")
fi

# ── Check 4: OpenZeppelin .sol files ──
OZ_PATH="$PROJECT_PATH/node_modules/@openzeppelin/contracts"
OZ_STATUS="not_found"
OZ_PACKAGES_ENTRY=""
if [ -d "$OZ_PATH" ]; then
    SOL_COUNT=$(find "$OZ_PATH" -name "*.sol" 2>/dev/null | wc -l)
    if [ "$SOL_COUNT" -gt 0 ]; then
        OZ_STATUS="ok"
        OZ_PACKAGES_ENTRY="@openzeppelin/contracts=$OZ_PATH"
        echo "✅ @openzeppelin/contracts found with .sol files ($SOL_COUNT+)" >&2
    else
        OZ_STATUS="empty"
        WARNINGS+=("@openzeppelin/contracts directory exists but has NO .sol files — certoraRun may fail on imports")
    fi
else
    OZ_STATUS="missing"
    WARNINGS+=("@openzeppelin/contracts not found in node_modules")
fi

# ── Check 4.5: OZ Address.sol unnamed return variable (v4.x) ──
if [ -d "$OZ_PATH" ] && [ -f "$OZ_PATH/utils/Address.sol" ]; then
    if grep -q 'returns (bytes memory)' "$OZ_PATH/utils/Address.sol" && \
       ! grep -q 'returns (bytes memory ret)' "$OZ_PATH/utils/Address.sol"; then
        WARNINGS+=("OZ Address.sol has unnamed return variables — use --ignore_solidity_warnings with certoraRun")
    fi
fi

# ── Check 5: Other common packages ──
PACKAGES_LIST=()
if [ -n "$OZ_PACKAGES_ENTRY" ]; then
    PACKAGES_LIST+=("$OZ_PACKAGES_ENTRY")
fi

# Check for other common Solidity imports
for pkg in "@chainlink/contracts" "@uniswap/v2-periphery" "@uniswap/v3-core" "hardhat"; do
    PKG_PATH="$PROJECT_PATH/node_modules/$pkg"
    if [ -d "$PKG_PATH" ]; then
        PKG_SOL_COUNT=$(find "$PKG_PATH" -name "*.sol" 2>/dev/null | wc -l)
        if [ "$PKG_SOL_COUNT" -gt 0 ]; then
            PACKAGES_LIST+=("$pkg=$PKG_PATH")
            echo "✅ Found package: $pkg" >&2
        fi
    fi
done

# ── Check 6: Create remappings.txt if needed ──
REMAPPINGS_CREATED="false"
if [ ${#PACKAGES_LIST[@]} -gt 0 ]; then
    REMAPPINGS_FILE="$PROJECT_PATH/remappings.txt"
    if [ ! -f "$REMAPPINGS_FILE" ]; then
        for entry in "${PACKAGES_LIST[@]}"; do
            echo "$entry" >> "$REMAPPINGS_FILE"
        done
        REMAPPINGS_CREATED="true"
        echo "✅ Created remappings.txt at $REMAPPINGS_FILE" >&2
    else
        echo "✅ remappings.txt already exists" >&2
    fi
fi

# ── Output results as JSON ──
echo "{"
echo "  \"project_path\": \"$PROJECT_PATH\","
echo "  \"solc_path\": \"$SOLC_PATH\","
echo "  \"solc_version\": \"$SOLC_VERSION\","
echo "  \"certoraRun_path\": \"$CERTORA_PATH\","
echo "  \"oz_status\": \"$OZ_STATUS\","
echo "  \"remappings_created\": $REMAPPINGS_CREATED,"

# Packages list
echo "  \"packages\": ["
for i in "${!PACKAGES_LIST[@]}"; do
    COMMA=""
    if [ "$i" -lt "$((${#PACKAGES_LIST[@]} - 1))" ]; then COMMA=","; fi
    echo "    \"${PACKAGES_LIST[$i]}\"$COMMA"
done
echo "  ],"

# Issues
echo "  \"issues\": ["
for i in "${!ISSUES[@]}"; do
    COMMA=""
    if [ "$i" -lt "$((${#ISSUES[@]} - 1))" ]; then COMMA=","; fi
    echo "    \"${ISSUES[$i]}\"$COMMA"
done
echo "  ],"

# Warnings
echo "  \"warnings\": ["
for i in "${!WARNINGS[@]}"; do
    COMMA=""
    if [ "$i" -lt "$((${#WARNINGS[@]} - 1))" ]; then COMMA=","; fi
    echo "    \"${WARNINGS[$i]}\"$COMMA"
done
echo "  ],"

# Overall status
if [ ${#ISSUES[@]} -eq 0 ]; then
    echo "  \"status\": \"PASS\""
else
    echo "  \"status\": \"FAIL\""
fi
echo "}"

# Exit with error if blocking issues found
if [ ${#ISSUES[@]} -gt 0 ]; then
    echo "" >&2
    echo "❌ BLOCKING ISSUES FOUND:" >&2
    for issue in "${ISSUES[@]}"; do
        echo "  - $issue" >&2
    done
    exit 1
fi

exit 0
