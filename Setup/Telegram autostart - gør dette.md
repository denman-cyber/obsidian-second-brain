# Telegram autostart - gør dette

Codex har gjort botten klar, men macOS blokerede for at Codex selv kunne installere LaunchAgenten.

Gør dette i Terminal på din Mac:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
Scripts/install-telegram-launchagent.sh
```

Når den er kørt, starter Telegram-botten automatisk som macOS-service.

## Test

Skriv til botten i Telegram:

```text
todo Test live bot
```

Tjek derefter dagens note:

```text
40_Daily/2026-07-04.md
```

## Stop senere

Hvis du vil stoppe servicen:

```bash
launchctl bootout gui/$(id -u)/com.christian.secondbrain.telegram-bot
```

## Vigtigt

Token og chat-id ligger i:

```text
/Users/christian/.second-brain.env
```

Den fil ligger uden for vaulten og bliver ikke pushet til GitHub.
