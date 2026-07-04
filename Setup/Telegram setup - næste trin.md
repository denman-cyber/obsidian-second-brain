# Telegram setup - næste trin

Telegram skal bruges som hurtig indbakke og daglige påmindelser.

## Første mål

Du skal kunne sende:

- `todo Ring til kunde`
- `done Ring til kunde`
- `note Ide til projekt`
- `plan i morgen Følg op på tilbud`
- `shoot Kunde X, lørdag kl. 10, portrætter`
- `kunde Kunde X, ønsker billeder til hjemmeside`

## Påmindelser

Anbefalet rytme:

- 08:00 Morgen: vælg Top 3
- 13:00 Middag: tjek dagens retning
- 20:30 Aften: luk dagen og flyt rester

## Token-regel

Telegram-token fra BotFather må ikke skrives ind i Obsidian-vaulten.

Når vi kobler botten på, skal token ligge uden for vaulten, fx i en lokal `.env`-fil et sikkert sted.

## Lokal test før rigtig Telegram

Flowet kan testes uden bot med:

```bash
Scripts/second-brain-command.sh "todo Ring til kunde"
Scripts/second-brain-command.sh "done Ring til kunde"
Scripts/second-brain-command.sh "note Ide til ny shoot-pakke"
Scripts/second-brain-command.sh "shoot Kunde X, lørdag kl. 10"
```

## Filer der nu er klar

- `Scripts/second-brain-command.sh`: lokal kommando-router.
- `Scripts/telegram-bot.py`: Telegram-bot, når token er sat.
- `Scripts/send-telegram-reminder.sh`: sender morgen-, middags- og aftenpåmindelser.
- `Setup/com.christian.secondbrain.reminder-morning.plist.template`: morgenpåmindelse.
- `Setup/com.christian.secondbrain.reminder-midday.plist.template`: middagspåmindelse.
- `Setup/com.christian.secondbrain.reminder-evening.plist.template`: aftenpåmindelse.
