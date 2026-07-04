#!/bin/zsh
set -euo pipefail

ENV_FILE="${SECOND_BRAIN_ENV:-$HOME/.second-brain.env}"
if [[ -f "$ENV_FILE" ]]; then
  source "$ENV_FILE"
fi

if [[ -z "${TELEGRAM_BOT_TOKEN:-}" || -z "${TELEGRAM_CHAT_ID:-}" ]]; then
  echo "Mangler TELEGRAM_BOT_TOKEN eller TELEGRAM_CHAT_ID i $ENV_FILE"
  exit 1
fi

KIND="${1:-morning}"

case "$KIND" in
  morning)
    MESSAGE="Godmorgen. Hvad er dine 3 vigtigste ting i dag?"
    ;;
  midday)
    MESSAGE="Kort tjek: er dagens Top 3 stadig realistisk?"
    ;;
  evening)
    MESSAGE="Vil du lukke dagen? Hvad blev gjort, og hvad skal flyttes til i morgen?"
    ;;
  *)
    MESSAGE="$*"
    ;;
esac

curl -sS \
  -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  -d "chat_id=${TELEGRAM_CHAT_ID}" \
  --data-urlencode "text=${MESSAGE}" >/dev/null

echo "Telegram reminder sent: $KIND"
