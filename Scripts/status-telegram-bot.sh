#!/bin/zsh
set -euo pipefail

PID_FILE="/tmp/second-brain-telegram-bot.pid"
OUT_LOG="/tmp/second-brain-telegram-bot.log"
ERR_LOG="/tmp/second-brain-telegram-bot.err"

if [[ -f "$PID_FILE" ]]; then
  PID="$(cat "$PID_FILE")"
  if kill -0 "$PID" 2>/dev/null; then
    echo "Telegram bot kører med PID $PID"
  else
    echo "Telegram bot PID-fil findes, men processen kører ikke."
  fi
else
  echo "Telegram bot er ikke startet via start-scriptet."
fi

echo "Log: $OUT_LOG"
echo "Fejl-log: $ERR_LOG"
