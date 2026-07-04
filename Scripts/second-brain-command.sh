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

timestamp_file() {
  local prefix="$1"
  local text="$2"
  echo "$(date '+%Y%m%d-%H%M%S')-$prefix-$(safe_name "$text").md"
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

  if { printf '| %s | Local command | %s | %s | %s |\n' "$NOW" "$action" "$files" "$result"; } >> "$LOG_FILE" 2>/dev/null; then
    return 0
  fi

  echo "Bemærk: kommandoen blev udført, men macOS blokerede skrivning til log.md." >&2
  return 0
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

  web\ *)
    TEXT="${COMMAND#web }"
    URL="$(echo "$TEXT" | awk '{print $1}')"
    TITLE="$(echo "$TEXT" | sed "s|^$URL *||")"
    if [[ -z "$TITLE" ]]; then
      TITLE="$URL"
    fi
    FILE="$VAULT_DIR/10_Knowledge/Sources/$(timestamp_file web "$TITLE")"
    cat > "$FILE" <<EOF
---
type: source
source_type: webpage
source_url: $URL
captured: $NOW
status: raw
sensitivity: private
ai_lock: false
---

# $TITLE

## Link
$URL

## Hvorfor gemt?
- 

## Noter
- 

## Mulige forbindelser
- 

## Skal bearbejdes til
- [ ] Vidensnote
- [ ] Projekt
- [ ] Opgave
- [ ] Arkiv
EOF
    log_action "Created web source" "10_Knowledge/Sources/$(basename "$FILE")" "OK"
    echo "Gemt som webkilde: $FILE"
    ;;

  youtube\ *)
    TEXT="${COMMAND#youtube }"
    URL="$(echo "$TEXT" | awk '{print $1}')"
    TITLE="$(echo "$TEXT" | sed "s|^$URL *||")"
    if [[ -z "$TITLE" ]]; then
      TITLE="$URL"
    fi
    FILE="$VAULT_DIR/10_Knowledge/Sources/$(timestamp_file youtube "$TITLE")"
    cat > "$FILE" <<EOF
---
type: source
source_type: youtube
source_url: $URL
captured: $NOW
status: raw
sensitivity: private
ai_lock: false
---

# $TITLE

## Video
$URL

## Hvorfor gemt?
- 

## Noter
- 

## Ideer eller pointer
- 

## Mulige forbindelser
- 

## Skal bearbejdes til
- [ ] Vidensnote
- [ ] Projekt
- [ ] Opgave
- [ ] Arkiv
EOF
    log_action "Created YouTube source" "10_Knowledge/Sources/$(basename "$FILE")" "OK"
    echo "Gemt som YouTube-kilde: $FILE"
    ;;

  shoot\ *)
    TEXT="${COMMAND#shoot }"
    FILE="$VAULT_DIR/20_Projects/$(timestamp_file shoot "$TEXT")"
    cat > "$FILE" <<EOF
---
type: shoot_brief
source: telegram_or_local_command
created: $NOW
status: planning
area: thellufsenfoto
sensitivity: business
ai_lock: false
---

# Shoot

## Rå briefing
$TEXT

## Kunde
- 

## Tid og sted
- 

## Formål
- 

## Shot list
- [ ] 

## Leverancer
- 

## Opfølgning
- [ ] 
EOF
    log_action "Created shoot brief" "20_Projects/$(basename "$FILE")" "OK"
    echo "Oprettet shoot brief: $FILE"
    ;;

  kunde\ *)
    TEXT="${COMMAND#kunde }"
    NAME="$(echo "$TEXT" | cut -d',' -f1 | sed 's/^ *//; s/ *$//')"
    SLUG="$(safe_name "$NAME")"
    FILE="$VAULT_DIR/30_Areas/CRM/$SLUG.md"
    mkdir -p "$VAULT_DIR/30_Areas/CRM"
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
    log_action "Created or updated client" "30_Areas/CRM/$(basename "$FILE")" "OK"
    echo "Kunde opdateret: $FILE"
    ;;

  *)
    echo "Ukendt kommando. Brug todo, done, plan i morgen, note, web, youtube, shoot eller kunde."
    exit 1
    ;;
esac
