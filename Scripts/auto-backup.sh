#!/bin/zsh
set -euo pipefail

VAULT_DIR="${SECOND_BRAIN_VAULT:-/Users/christian/Documents/Codex/Second brain}"
LOCK_DIR="/tmp/second-brain-auto-backup.lock"
NOW="$(date '+%Y-%m-%d %H:%M:%S')"

cleanup() {
  rmdir "$LOCK_DIR" 2>/dev/null || true
}

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  echo "Auto-backup kører allerede. Springer over."
  exit 0
fi
trap cleanup EXIT

cd "$VAULT_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Ikke et Git-repo: $VAULT_DIR"
  exit 1
fi

if ! git diff --quiet -- .gitignore; then
  echo "Bemærk: .gitignore er ændret."
fi

if git ls-remote --exit-code origin >/dev/null 2>&1; then
  git pull --ff-only origin main
else
  echo "Kunne ikke kontakte origin. Fortsætter med lokal backup-commit, hvis der er ændringer."
fi

if git status --porcelain | grep -q '^'; then
  if rg -n --hidden --glob '!.git/**' \
    '(github_pat_[A-Za-z0-9_]+|ghp_[A-Za-z0-9_]+|BEGIN (RSA|OPENSSH|PRIVATE) KEY|TELEGRAM_BOT_TOKEN="?[^"I][^"]+|TELEGRAM_CHAT_ID="?[0-9-]+)' . >/tmp/second-brain-secret-scan.log 2>/dev/null; then
    echo "Mulig secret fundet. Auto-backup stoppet."
    cat /tmp/second-brain-secret-scan.log
    exit 2
  fi

  git add -A

  if git diff --cached --quiet; then
    echo "Ingen staged ændringer efter git add."
    exit 0
  fi

  git commit -m "Auto backup: $NOW"
  git push origin main
  echo "Auto-backup færdig: $NOW"
else
  echo "Ingen ændringer at backuppe: $NOW"
fi
