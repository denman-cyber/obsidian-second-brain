#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
APP_SUPPORT="$HOME/.second-brain"
TARGET_DIR="$HOME/Library/LaunchAgents"
TARGET_PLIST="$TARGET_DIR/com.christian.secondbrain.auto-backup.plist"
LABEL="com.christian.secondbrain.auto-backup"
DOMAIN="gui/$(id -u)"

mkdir -p "$APP_SUPPORT" "$TARGET_DIR"
cp "$VAULT_DIR/Scripts/auto-backup.sh" "$APP_SUPPORT/auto-backup.sh"
chmod +x "$APP_SUPPORT/auto-backup.sh"
xattr -c "$APP_SUPPORT/auto-backup.sh" 2>/dev/null || true

cp "$VAULT_DIR/Setup/com.christian.secondbrain.auto-backup.plist" "$TARGET_PLIST"
chmod 644 "$TARGET_PLIST"
xattr -c "$TARGET_PLIST" 2>/dev/null || true

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET_PLIST"
launchctl enable "$DOMAIN/$LABEL"
launchctl kickstart -k "$DOMAIN/$LABEL"

echo "Auto-backup installeret og startet."
echo "Den kører cirka hver time."
