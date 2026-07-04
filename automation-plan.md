# Automation Plan

Dette er planen for automations, før de sættes aktivt op.

## Fase A: Lokal daglig struktur

- Opret dagens daily note hver morgen.
- Flyt eventuelle valgte opgaver fra gårsdagens note.
- Send morgenpåmindelse via Telegram, når Telegram er koblet på.
- Lokal script-klargøring: `Scripts/create-daily-note.sh`.

## Fase B: Raw to Wiki

- Saml hurtige noter, web, YouTube og shoot-input i `raw`.
- Behandl rå input til `wiki`, `crm`, `journal` eller opgaver.
- Flyt behandlede rå filer til `raw/processed`.
- Flyt ikke følsomt indhold uden manuel godkendelse.

## Fase C: Git-backup

- Opret privat GitHub-repo.
- Lav første manuelle commit.
- Test pull og push manuelt.
- Først derefter aktiveres automatisk backup.

## Fase D: Telegram

- Opret bot via BotFather.
- Gem token uden for vaulten.
- Test kommandoerne `todo`, `note`, `shoot`.
- Tilføj påmindelser kl. 08:00, 13:00 og 20:30.
- Lokal kommando-router er klargjort som `Scripts/second-brain-command.sh`.

## Fase E: VPS/Hermes

- Opret separat VPS-bruger.
- Giv adgang til repo med deploy key.
- Lås agenten til `thellufsenfoto-hermes/`.
- Test at den ikke kan arbejde uden for scoped mappe.
