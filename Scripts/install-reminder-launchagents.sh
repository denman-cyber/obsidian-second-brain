#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
APP_SUPPORT="$HOME/.second-brain"
TARGET_DIR="$HOME/Library/LaunchAgents"
DOMAIN="gui/$(id -u)"

mkdir -p "$APP_SUPPORT" "$TARGET_DIR"
cp "$VAULT_DIR/Scripts/send-telegram-reminder.sh" "$APP_SUPPORT/send-telegram-reminder.sh"
chmod +x "$APP_SUPPORT/send-telegram-reminder.sh"
xattr -c "$APP_SUPPORT/send-telegram-reminder.sh" 2>/dev/null || true

for name in morning midday evening; do
  source_plist="$VAULT_DIR/Setup/com.christian.secondbrain.reminder-$name.plist.template"
  target_plist="$TARGET_DIR/com.christian.secondbrain.reminder-$name.plist"
  cp "$source_plist" "$target_plist"
  chmod 644 "$target_plist"
  xattr -c "$target_plist" 2>/dev/null || true
  launchctl bootout "$DOMAIN/com.christian.secondbrain.reminder-$name" 2>/dev/null || true
  launchctl bootstrap "$DOMAIN" "$target_plist"
  launchctl enable "$DOMAIN/com.christian.secondbrain.reminder-$name"
done

echo "Telegram-påmindelser installeret:"
echo "- 08:00 morning"
echo "- 13:00 midday"
echo "- 20:30 evening"
