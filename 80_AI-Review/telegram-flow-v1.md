---
type: ai_review
status: proposed
sensitivity: private
ai_lock: false
---

# Telegram Flow v1

Dette er første forslag til, hvordan Telegram skal tale med din Second Brain.

## Påmindelser

### Morgen

Tidspunkt: 08:00

Besked:

> Godmorgen. Hvad er dine 3 vigtigste ting i dag?

Handling:
- opret dagens daily note, hvis den mangler
- vis tomme eller eksisterende Top 3

### Middag

Tidspunkt: 13:00

Besked:

> Kort tjek: er dagens Top 3 stadig realistisk?

Handling:
- vis dagens uafsluttede Top 3
- giv mulighed for at tilføje eller flytte opgaver

### Aften

Tidspunkt: 20:30

Besked:

> Vil du lukke dagen? Hvad blev gjort, og hvad skal flyttes til i morgen?

Handling:
- marker færdige opgaver
- flyt udvalgte opgaver til morgendagens note
- skriv kort aftenreview

## Kommandoer

### `todo [tekst]`

Tilføjer opgaven til `## I dag` i dagens daily note.

### `done [tekst]`

Markerer matchende opgave som færdig i dagens daily note.

### `plan i morgen [tekst]`

Tilføjer opgaven til morgendagens daily note.

### `note [tekst]`

Opretter en note i `00_Inbox`.

### `shoot [tekst]`

Opretter input i `thellufsenfoto-hermes/raw`.

### `kunde [tekst]`

Opretter eller opdaterer kundekort i `thellufsenfoto-hermes/clients`.

## Sikkerhedsregel

Telegram skal ikke bruges til API-nøgler, passwords, CPR-numre, fulde kontrakter eller andre følsomme oplysninger.
