# Telegram bot - teknisk opsætning

Denne opsætning holder tokens uden for Obsidian-vaulten.

## 1. Opret bot

1. Åbn Telegram.
2. Find `@BotFather`.
3. Skriv `/newbot`.
4. Gem tokenet et sikkert sted.

## 2. Opret lokal secret-fil

Secret-filen skal ligge uden for vaulten:

```bash
nano ~/.second-brain.env
```

Indhold:

```bash
TELEGRAM_BOT_TOKEN="dit-token-her"
TELEGRAM_CHAT_ID="dit-chat-id-her"
```

## 3. Find chat id

Når botten har fået en besked fra dig, kan chat id findes via:

```bash
curl "https://api.telegram.org/botDIT_TOKEN/getUpdates"
```

## 4. Test reminder

```bash
Scripts/send-telegram-reminder.sh morning
```

## 5. Test kommando-bot

```bash
Scripts/telegram-bot.py
```

Skriv derefter til botten:

```text
todo Ring til kunde
note Ide til shoot
web https://example.com Artikel jeg vil gemme
youtube https://youtube.com/... Video om portrætlys
shoot Kunde X, lørdag kl. 10
kunde Kunde X, ønsker billeder til hjemmeside
```

Du kan også sende flere kommandoer i samme besked, men brug én kommando pr. linje:

```text
note Ide til ny foto-pakke
web https://example.com Artikel om markedsføring
youtube https://youtube.com/... Video om portrætlys
shoot Kunde X, lørdag kl 10, portrætter
plan i morgen Følg op på tilbud
done Backup test fra Telegram
```

## 6. Næste trin

Når botten virker manuelt, kan den startes automatisk på Mac Mini med LaunchAgent.

## Daglig drift

Botten kan startes, stoppes og tjekkes sådan:

```bash
Scripts/start-telegram-bot.sh
Scripts/status-telegram-bot.sh
Scripts/stop-telegram-bot.sh
```

Logfiler:

```text
/tmp/second-brain-telegram-bot.log
/tmp/second-brain-telegram-bot.err
```

Bemærk: Denne metode holder botten kørende i baggrunden, men autostart efter genstart kræver en LaunchAgent i `~/Library/LaunchAgents`.

## Aktuel launchd-service

Der ligger også en launchd-plist her:

```text
Setup/com.christian.secondbrain.telegram-bot.plist
```

Den kan indlæses i den aktuelle macOS-session med:

```bash
launchctl bootstrap gui/$(id -u) "Setup/com.christian.secondbrain.telegram-bot.plist"
```

For permanent autostart efter genstart skal plist-filen kopieres til:

```text
~/Library/LaunchAgents/
```

Der er lavet et script til det:

```bash
Scripts/install-telegram-launchagent.sh
```
