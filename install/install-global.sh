#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${HOME}/.flutter-ai-agent"

rm -rf "${TARGET_DIR}"
mkdir -p "${TARGET_DIR}"

cp -R "${SOURCE_DIR}/SKILL.md" "${TARGET_DIR}/"
cp -R "${SOURCE_DIR}/rules" "${TARGET_DIR}/"
cp -R "${SOURCE_DIR}/skills" "${TARGET_DIR}/"
cp -R "${SOURCE_DIR}/commands" "${TARGET_DIR}/"
cp -R "${SOURCE_DIR}/templates" "${TARGET_DIR}/"
cp -R "${SOURCE_DIR}/adapters" "${TARGET_DIR}/"

echo "Installed Flutter AI Agent to ${TARGET_DIR}"
echo "Use the adapter for your coding agent and keep project-specific rules in each repository."
