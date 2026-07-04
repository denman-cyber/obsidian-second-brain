#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_PLIST="$VAULT_DIR/Setup/com.christian.secondbrain.telegram-bot.plist"
TARGET_DIR="$HOME/Library/LaunchAgents"
TARGET_PLIST="$TARGET_DIR/com.christian.secondbrain.telegram-bot.plist"
LABEL="com.christian.secondbrain.telegram-bot"
DOMAIN="gui/$(id -u)"

mkdir -p "$TARGET_DIR"
cp "$SOURCE_PLIST" "$TARGET_PLIST"
chmod 644 "$TARGET_PLIST"

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET_PLIST"
launchctl enable "$DOMAIN/$LABEL"
launchctl kickstart -k "$DOMAIN/$LABEL"

echo "Telegram bot LaunchAgent installeret og startet."
echo "Tjek status med:"
echo "launchctl print $DOMAIN/$LABEL"
