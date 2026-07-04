#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="${SECOND_BRAIN_VAULT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
DAY="$(date +%F)"
NOW="$(date '+%Y-%m-%d %H:%M:%S')"

DAILY_NOTE="$VAULT_DIR/40_Daily/$DAY.md"
LOG_FILE="$VAULT_DIR/log.md"

safe_name() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]æøåÆØÅ' '-' | sed 's/^-//; s/-$//'
}

append_after_heading() {
  local file="$1"
  local heading="$2"
  local line="$3"

  if [[ ! -r "$file" || ! -w "$file" ]]; then
    echo "Kan ikke åbne daily note. macOS blokerer sandsynligvis botten fra Documents-mappen: $file"
    echo "Giv Python/zsh Full Disk Access, og kør install-scriptet igen."
    exit 13
  fi

  awk -v heading="$heading" -v line="$line" '
    $0 == heading && done == 0 {
      print
      print line
      done = 1
      next
    }
    { print }
    END {
      if (done == 0) {
        print ""
        print heading
        print line
      }
    }
  ' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"
}

log_action() {
  local action="$1"
  local files="$2"
  local result="$3"
  if [[ ! -w "$LOG_FILE" ]]; then
    echo "Kan ikke skrive til log.md. macOS blokerer sandsynligvis botten fra vaulten."
    exit 13
  fi
  printf '| %s | Local command | %s | %s | %s |\n' "$NOW" "$action" "$files" "$result" >> "$LOG_FILE"
}

if [[ $# -lt 1 ]]; then
  echo 'Brug: Scripts/second-brain-command.sh "todo Ring til kunde"'
  exit 1
fi

"$SCRIPT_DIR/create-daily-note.sh" "$DAY" >/dev/null

COMMAND="$*"
LOWER="$(echo "$COMMAND" | tr '[:upper:]' '[:lower:]')"

case "$LOWER" in
  todo\ *)
    TEXT="${COMMAND#todo }"
    append_after_heading "$DAILY_NOTE" "## I dag" "- [ ] $TEXT"
    log_action "Added todo" "40_Daily/$DAY.md" "OK"
    echo "Tilføjet til dagens liste: $TEXT"
    ;;

  done\ *)
    TEXT="${COMMAND#done }"
    if grep -F -- "- [ ] $TEXT" "$DAILY_NOTE" >/dev/null; then
      perl -0pi -e "s/\\Q- [ ] $TEXT\\E/- [x] $TEXT/" "$DAILY_NOTE"
      log_action "Marked todo done" "40_Daily/$DAY.md" "OK"
      echo "Markeret som færdig: $TEXT"
    else
      echo "Jeg fandt ikke opgaven i dagens note: $TEXT"
      log_action "Marked todo done" "40_Daily/$DAY.md" "Not found"
    fi
    ;;

  plan\ i\ morgen\ *)
    TEXT="${COMMAND#plan i morgen }"
    TOMORROW="$(date -v+1d +%F 2>/dev/null || date -d tomorrow +%F)"
    "$SCRIPT_DIR/create-daily-note.sh" "$TOMORROW" >/dev/null
    append_after_heading "$VAULT_DIR/40_Daily/$TOMORROW.md" "## I dag" "- [ ] $TEXT"
    log_action "Planned tomorrow" "40_Daily/$TOMORROW.md" "OK"
    echo "Planlagt til i morgen: $TEXT"
    ;;

  note\ *)
    TEXT="${COMMAND#note }"
    FILE="$VAULT_DIR/00_Inbox/$(date '+%Y%m%d-%H%M%S')-$(safe_name "$TEXT").md"
    cat > "$FILE" <<EOF
---
type: inbox_note
source: telegram_or_local_command
created: $NOW
status: raw
sensitivity: private
ai_lock: false
---

# Hurtig note

$TEXT
EOF
    log_action "Created inbox note" "00_Inbox/$(basename "$FILE")" "OK"
    echo "Oprettet i inbox: $FILE"
    ;;

  shoot\ *)
    TEXT="${COMMAND#shoot }"
    FILE="$VAULT_DIR/thellufsenfoto-hermes/raw/$(date '+%Y%m%d-%H%M%S')-shoot.md"
    cat > "$FILE" <<EOF
---
type: raw_input
source: telegram_or_local_command
created: $NOW
status: raw
area: thellufsenfoto
sensitivity: business
ai_lock: false
---

# Shoot input

$TEXT
EOF
    log_action "Created shoot input" "thellufsenfoto-hermes/raw/$(basename "$FILE")" "OK"
    echo "Oprettet shoot-input: $FILE"
    ;;

  kunde\ *)
    TEXT="${COMMAND#kunde }"
    NAME="$(echo "$TEXT" | cut -d',' -f1 | sed 's/^ *//; s/ *$//')"
    SLUG="$(safe_name "$NAME")"
    FILE="$VAULT_DIR/thellufsenfoto-hermes/clients/$SLUG.md"
    if [[ ! -f "$FILE" ]]; then
      cat > "$FILE" <<EOF
---
type: client
status: active
area: thellufsenfoto
sensitivity: confidential
ai_lock: false
---

# $NAME

## Kontakt
- Navn: $NAME
- Telefon:
- Email:

## Noter
- $TEXT
EOF
    else
      printf '\n- %s: %s\n' "$NOW" "$TEXT" >> "$FILE"
    fi
    log_action "Created or updated client" "thellufsenfoto-hermes/clients/$(basename "$FILE")" "OK"
    echo "Kunde opdateret: $FILE"
    ;;

  *)
    echo "Ukendt kommando. Brug todo, done, plan i morgen, note, shoot eller kunde."
    exit 1
    ;;
esac
