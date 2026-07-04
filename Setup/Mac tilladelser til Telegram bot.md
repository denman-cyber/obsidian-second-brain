# Mac tilladelser til Telegram bot

Hvis botten svarer med en fejl som:

```text
awk: can't open file /Users/christian/Documents/Codex/Second brain/daily/...
```

så kører botten, men macOS giver ikke baggrundsservicen adgang til Documents-mappen.

## Løsning

1. Åbn **System Settings**.
2. Gå til **Privacy & Security**.
3. Gå til **Full Disk Access**.
4. Klik på `+`.
5. Tryk `Cmd + Shift + G`.
6. Tilføj disse, hvis de kan vælges:

```text
/Library/Developer/CommandLineTools/usr/bin/python3
/usr/bin/python3
/bin/zsh
/bin/bash
```

7. Sørg for at de er slået til i listen.
8. Kør derefter i Terminal:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
Scripts/install-telegram-launchagent.sh
```

9. Test i Telegram:

```text
todo Test live bot 3
```

## Hvis macOS ikke lader dig vælge Python

Tilføj Terminal til Full Disk Access, og kør derefter botten manuelt fra Terminal som midlertidig løsning:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
python3 Scripts/telegram-bot.py
```

Mens den kører, kan Telegram-kommandoer skrive til vaulten.
