#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PID_FILE="/tmp/second-brain-telegram-bot.pid"
OUT_LOG="/tmp/second-brain-telegram-bot.log"
ERR_LOG="/tmp/second-brain-telegram-bot.err"

if [[ -f "$PID_FILE" ]]; then
  PID="$(cat "$PID_FILE")"
  if kill -0 "$PID" 2>/dev/null; then
    echo "Telegram bot kører allerede med PID $PID"
    exit 0
  fi
fi

cd "$VAULT_DIR"
python3 "$SCRIPT_DIR/telegram-bot.py" >> "$OUT_LOG" 2>> "$ERR_LOG" &
PID="$!"
disown "$PID" 2>/dev/null || true
echo "$PID" > "$PID_FILE"

echo "Telegram bot startet med PID $PID"
echo "Log: $OUT_LOG"
echo "Fejl-log: $ERR_LOG"
