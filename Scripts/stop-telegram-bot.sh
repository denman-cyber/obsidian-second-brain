#!/bin/zsh
set -euo pipefail

PID_FILE="/tmp/second-brain-telegram-bot.pid"

if [[ ! -f "$PID_FILE" ]]; then
  echo "Telegram bot ser ikke ud til at køre."
  exit 0
fi

PID="$(cat "$PID_FILE")"
if kill -0 "$PID" 2>/dev/null; then
  kill "$PID"
  echo "Telegram bot stoppet: PID $PID"
else
  echo "PID-filen fandtes, men processen kørte ikke."
fi

rm -f "$PID_FILE"
