# Telegram - gør dette nu

## 1. Opret botten

1. Åbn Telegram.
2. Søg efter `@BotFather`.
3. Skriv `/newbot`.
4. Følg instruktionerne.
5. Kopier tokenet.

Tokenet ligner noget i denne stil:

```text
1234567890:AA...
```

## 2. Send en besked til botten

Når botten er oprettet, skal du åbne den i Telegram og skrive:

```text
start
```

Det er nødvendigt, før vi kan finde dit chat-id.

## 3. Giv tokenet til Codex

Når du har tokenet, skriv det til Codex i denne chat.

Codex gemmer det i:

```text
/Users/christian/.second-brain.env
```

Den fil ligger uden for vaulten og bliver ikke pushet til GitHub.

## 4. Testkommandoer bagefter

Når botten er koblet på, tester vi:

```text
todo Ring til kunde
note Ide til shoot
shoot Kunde X, lørdag kl. 10
done Ring til kunde
```

## 5. Påmindelser

Når botten virker, aktiverer vi:

- 08:00 morgen: Top 3
- 13:00 middag: retningstjek
- 20:30 aften: luk dagen
