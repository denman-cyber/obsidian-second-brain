---
name: Second Brain Controller
description: Regler for AI, automations, Telegram-flow og scoped adgang i denne Obsidian-vault.
---

# Formål

Denne vault er Christians lokale Second Brain. Den skal hjælpe med daglige opgaver, noter, viden, projekter og thellufsenfoto, uden at private eller følsomme oplysninger blandes sammen.

# Globale regler

- Svar og skriv som udgangspunkt på dansk.
- Brug et rent, professionelt noteformat uden emojis.
- Bevar brugerens originale intention. Omskriv ikke personlige noter hårdere end nødvendigt.
- Ændr aldrig filer med `ai_lock: true`, medmindre brugeren eksplicit beder om det.
- Ved væsentlige ændringer: skriv først forslag i `80_AI-Review/`.
- Log vigtige AI-handlinger i `log.md`.
- Brug wikilinks, når en note naturligt relaterer sig til en anden note.
- Hvis en kilde bruges til en vidensnote, skal kilden fremgå i frontmatter eller under afsnittet `Kilder`.

# Følsomhed

Brug disse værdier i frontmatter, når det giver mening:

- `sensitivity: private` til journal, personlige refleksioner og private forhold.
- `sensitivity: business` til almindeligt arbejde og thellufsenfoto.
- `sensitivity: confidential` til kundeoplysninger, økonomi, kontrakter eller persondata.
- `sensitivity: public` til materiale, der trygt kan deles.

# Mapper

## `00_Inbox`

Alt nyt og uafklaret starter her. AI må sortere og foreslå placering, men bør ikke slette indhold uden klar ordre.

## `10_Knowledge`

Bearbejdet viden.

- `10_Knowledge/Sources`: rå eller let rensede kilder.
- `10_Knowledge/Notes`: bearbejdede vidensnoter.

AI må oprette og opdatere vidensnoter, når kilden er tydelig.

## `20_Projects`

Aktive projekter. AI må hjælpe med status, næste handlinger og struktur.

## `30_Areas`

Løbende ansvarsområder. AI må hjælpe med overblik, men skal være forsigtig med følsomme oplysninger.

## `40_Daily`

Daglige noter og dagens to do. AI må oprette dagens note, flytte uafsluttede opgaver frem og lave opsummeringer.

## `50_Tasks`

Opgaver der ikke kun hører til en enkelt dag. AI må oprette opgavefiler og foreslå prioritering.

## `60_Reviews`

Ugentlige og månedlige reviews. AI må opsummere ud fra daily notes og projekter.

## `80_AI-Review`

Mellemstation for forslag, omskrivninger og ændringer, som bør godkendes før de føres ind i vigtige noter.

## `90_Archive`

Afsluttet materiale. AI må arkivere efter klar regel eller eksplicit ordre.

# thellufsenfoto Agent

`thellufsenfoto-hermes/` er det eneste område, en ekstern Hermes/VPS-agent må arbejde i.

Hermes må:

- læse og skrive i `thellufsenfoto-hermes/raw/`
- flytte behandlede input til `thellufsenfoto-hermes/processed/`
- oprette projekter i `thellufsenfoto-hermes/projects/`
- oprette kundekort i `thellufsenfoto-hermes/clients/`

Hermes må ikke:

- læse eller skrive i `40_Daily`
- læse eller skrive i private journalnoter
- læse eller skrive i personligt CRM uden for scoped thellufsenfoto-mappen
- ændre vaultens rod, templates, `agents.md` eller private vidensnoter

# Telegram-kommandoforslag

Når Telegram kobles på, bør beskeder fortolkes sådan:

- `todo [tekst]`: tilføj opgave til dagens daily note.
- `done [tekst]`: marker matchende opgave som færdig i dagens daily note.
- `note [tekst]`: opret hurtig note i `00_Inbox`.
- `plan i morgen [tekst]`: tilføj opgave til morgendagens daily note.
- `shoot [tekst]`: opret rå thellufsenfoto-input i `thellufsenfoto-hermes/raw/`.
- `kunde [tekst]`: opret eller opdater kundekort i `thellufsenfoto-hermes/clients/`.

# Daglig arbejdsgang

## Morgen

1. Opret dagens daily note, hvis den ikke findes.
2. Flyt relevante uafsluttede opgaver fra i går.
3. Vælg dagens Top 3.

## Middag

1. Tjek om Top 3 stadig er realistisk.
2. Tilføj eller flyt opgaver efter behov.

## Aften

1. Marker hvad der blev gjort.
2. Flyt det vigtige videre til i morgen.
3. Skriv kort hvad der fylder, og hvad der skal have opmærksomhed.

# Git og sync

- Commit aldrig secrets, tokens eller private API-nøgler.
- Brug ikke `git add .` i automatiseringer, før systemet er testet.
- Stop sync ved merge-konflikter.
- Hermes/VPS må kun committe ændringer i `thellufsenfoto-hermes/`.
