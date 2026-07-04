#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_PLIST="$VAULT_DIR/Setup/com.christian.secondbrain.telegram-bot.plist"
APP_SUPPORT="$HOME/.second-brain"
TARGET_DIR="$HOME/Library/LaunchAgents"
TARGET_PLIST="$TARGET_DIR/com.christian.secondbrain.telegram-bot.plist"
LABEL="com.christian.secondbrain.telegram-bot"
DOMAIN="gui/$(id -u)"

mkdir -p "$APP_SUPPORT"
cp "$VAULT_DIR/Scripts/telegram-bot.py" "$APP_SUPPORT/telegram-bot.py"
cp "$VAULT_DIR/Scripts/second-brain-command.sh" "$APP_SUPPORT/second-brain-command.sh"
cp "$VAULT_DIR/Scripts/create-daily-note.sh" "$APP_SUPPORT/create-daily-note.sh"
chmod +x "$APP_SUPPORT/telegram-bot.py" "$APP_SUPPORT/second-brain-command.sh" "$APP_SUPPORT/create-daily-note.sh"
xattr -c "$APP_SUPPORT/telegram-bot.py" "$APP_SUPPORT/second-brain-command.sh" "$APP_SUPPORT/create-daily-note.sh" 2>/dev/null || true

mkdir -p "$TARGET_DIR"
sed "s|/Users/christian/Documents/Codex/Second brain/Scripts/telegram-bot.py|$APP_SUPPORT/telegram-bot.py|g; s|/Users/christian/Documents/Codex/Second brain/Scripts/second-brain-command.sh|$APP_SUPPORT/second-brain-command.sh|g; s|/Users/christian/Documents/Codex/Second brain|$VAULT_DIR|g" "$SOURCE_PLIST" > "$TARGET_PLIST"
chmod 644 "$TARGET_PLIST"
xattr -c "$TARGET_PLIST" 2>/dev/null || true

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET_PLIST"
launchctl enable "$DOMAIN/$LABEL"
launchctl kickstart -k "$DOMAIN/$LABEL"

echo "Telegram bot LaunchAgent installeret og startet."
echo "Tjek status med:"
echo "launchctl print $DOMAIN/$LABEL"
