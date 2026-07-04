# Automatisk backup og påmindelser

## Installer påmindelser

Kør i Terminal:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
git pull
Scripts/install-reminder-launchagents.sh
```

Det installerer:

- 08:00 morgenpåmindelse
- 13:00 middagstjek
- 20:30 aftenreview

## Installer auto-backup

Kør i Terminal:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
Scripts/install-auto-backup-launchagent.sh
```

Auto-backup kører cirka hver time.

## Hvad auto-backup gør

1. Henter nyeste version fra GitHub.
2. Stopper ved Git-konflikt.
3. Scanner for tydelige secrets.
4. Committer ændringer med tidspunkt.
5. Pusher til GitHub.

## Logs

```text
/tmp/second-brain-auto-backup.log
/tmp/second-brain-auto-backup.err
```

## Test manuelt

```bash
Scripts/auto-backup.sh
```

Hvis der ikke er ændringer, svarer den bare, at der ikke er noget at backuppe.
