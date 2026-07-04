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
shoot Kunde X, lørdag kl. 10
```

## 6. Næste trin

Når botten virker manuelt, kan den startes automatisk på Mac Mini med LaunchAgent.
