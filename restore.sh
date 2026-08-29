#!/usr/bin/env bash
# Restore OpenCode + mcpo configs from this backup.
#
# Privacy safe: this repo holds NO secrets — only {env:VAR} references.
# Existing configs are snapshotted (not deleted) before overwrite.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d_%H%M%S)"

echo "==> Restoring OpenCode + mcpo configs (timestamp: $STAMP)"

# 1. OpenCode config
mkdir -p "$HOME/.config/opencode"
if [ -f "$HOME/.config/opencode/opencode.jsonc" ]; then
  cp "$HOME/.config/opencode/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc.bak-$STAMP"
  echo "    snapshot: ~/.config/opencode/opencode.jsonc.bak-$STAMP"
fi
cp "$DIR/opencode/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc"
echo "    restored ~/.config/opencode/opencode.jsonc"

# 2. mcpo config (secrets-free; enforce 600 permissions on restore)
mkdir -p "$HOME/.config/mcpo"
if [ -f "$HOME/.config/mcpo/config.json" ]; then
  cp "$HOME/.config/mcpo/config.json" "$HOME/.config/mcpo/config.json.bak-$STAMP"
  echo "    snapshot: ~/.config/mcpo/config.json.bak-$STAMP"
fi
cp "$DIR/mcpo/config.json" "$HOME/.config/mcpo/config.json"
chmod 600 "$HOME/.config/mcpo/config.json"
echo "    restored ~/.config/mcpo/config.json (chmod 600)"

echo "==> Done. Restart OpenCode / mcpo for changes to take effect."