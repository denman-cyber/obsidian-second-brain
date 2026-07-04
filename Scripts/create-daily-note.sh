#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="${SECOND_BRAIN_VAULT:-$(cd "$SCRIPT_DIR/.." && pwd)}"

DAY="${1:-$(date +%F)}"
DAILY_DIR="$VAULT_DIR/40_Daily"
TEMPLATE="$VAULT_DIR/Templates/Daily Note.md"
TARGET="$DAILY_DIR/$DAY.md"

mkdir -p "$DAILY_DIR"

if [[ -f "$TARGET" ]]; then
  echo "Daily note already exists: $TARGET"
  exit 0
fi

if [[ -f "$TEMPLATE" ]]; then
  sed "s/{{date}}/$DAY/g" "$TEMPLATE" > "$TARGET"
else
  cat > "$TARGET" <<EOF
---
type: daily
date: $DAY
status: active
sensitivity: private
reminder_channel: telegram
ai_lock: false
---

# $DAY

## Top 3
- [ ] 
- [ ] 
- [ ] 

## I dag
- [ ] 

## Aftaler
- 

## Hurtige noter
- 

## Flyttes til i morgen
- [ ] 

## Aftenreview
- Hvad blev gjort?
- Hvad skal flyttes?
- Hvad fylder?
EOF
fi

echo "Created daily note: $TARGET"
