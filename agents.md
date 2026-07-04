---
name: Second Brain Controller
description: Styrer den lokale Obsidian Second Brain med raw -> wiki processing, CRM, journal, daily notes og Git backup.
---

# Formål

Denne vault skal være en selvopretholdende Second Brain.

Hovedideen er enkel:

```text
raw/ -> wiki/ -> index.md
```

Alt ubehandlet lander i `raw/`. Codex behandler løbende nye kilder, skaber eller opdaterer krydslinkede wiki-sider i `wiki/`, flytter rå kilder til `raw/processed/`, opdaterer `index.md` og skriver til `log.md`.

# Globale regler

- Skriv som udgangspunkt på dansk.
- Brug et rent, professionelt noteformat uden emojis.
- Slet aldrig noter permanent.
- Ændr aldrig filer med `ai_lock: true`, medmindre brugeren eksplicit beder om det.
- Bevar rå kilder. Rå kilder må flyttes til `raw/processed/`, men ikke omskrives destruktivt.
- Alle wiki-noter skal henvise til deres kilde(r).
- Brug wikilinks aktivt, så noter bliver en sammenhængende vidensbase.
- Hvis noget er uklart, følsomt eller tvetydigt, så læg en kort rapport i `80_AI-Review/` i stedet for at gætte.
- Log væsentlige handlinger i `log.md`, men lad aldrig log-fejl stoppe en ellers korrekt handling.

# Primære mapper

## `raw/`

Ubehandlet input:

- websider
- YouTube-links eller transskriptioner
- hurtige noter
- shoot-briefs
- ideer
- løse observationer

Regel: `raw/` er indbakken til viden. Den må gerne være rodet kortvarigt, men skal løbende tømmes af automationen.

## `raw/processed/`

Historik over behandlede rå kilder.

Når en kilde er behandlet til `wiki/`, `crm/`, `journal/` eller en opgave, flyttes den hertil.

## `wiki/`

Den strukturerede, AI-forarbejdede vidensbase.

Wiki-sider skal være:

- korte nok til at være brugbare
- tydeligt navngivet
- krydslinkede
- kildebaserede
- skrevet så de kan læses uden at åbne råkilden

En wiki-note bør have:

```markdown
---
type: wiki
status: active
source:
created:
updated:
sensitivity: private
ai_lock: false
---

# Titel

## Kort fortalt

## Centrale pointer

## Hvorfor det er nyttigt

## Relaterede noter

## Kilder
```

## `journal/`

Private refleksioner og dagbogsnoter.

Telegram eller Codex kan oprette journalnoter, når input starter med `journal`.

Journal må gerne linke til `wiki/` og `crm/`, men skal behandles mere forsigtigt end almindelige kilder.

## `crm/`

Personer, kunder og relationer.

CRM-filer skal som udgangspunkt hedde personens eller kundens navn.

CRM må gerne linke til:

- relevante shoots
- noter fra samtaler
- wiki-emner
- opfølgningsopgaver

## `40_Daily/`

Daily notes og dagens to do. Dette er dit cockpit, ikke din vidensbase.

## `80_AI-Review/`

AI-forslag, tvivlsspørgsmål og rapporter fra automationer.

## `90_Archive/`

Arkiv og testdata.

# Telegram-kommandoer

- `todo [tekst]`: tilføj opgave til dagens daily note.
- `done [tekst]`: marker matchende opgave som færdig i dagens daily note.
- `plan i morgen [tekst]`: tilføj opgave til morgendagens daily note.
- `note [tekst]`: opret rå note i `raw/`.
- `web [url] [titel/noter]`: opret webkilde i `raw/`.
- `youtube [url] [titel/noter]`: opret YouTube-kilde i `raw/`.
- `journal [tekst]`: opret journalnotat i `journal/`.
- `kunde [navn], [noter]`: opret eller opdater kundekort i `crm/`.
- `shoot [tekst]`: opret rå shoot-brief i `raw/`.

# Operation 1: Ingest

Når automationen behandler nye filer:

1. Læs nye filer i `raw/`.
2. Vurder type: kilde, opgave, kunde, journal, projekt, shoot eller arkiv.
3. Opret eller opdater relevante wiki-sider i `wiki/`.
4. Opret eller opdater `crm/`, hvis input handler om en person/kunde.
5. Tilføj relevante wikilinks.
6. Opdater `index.md`.
7. Skriv rapport i `80_AI-Review/`.
8. Flyt behandlede rå filer til `raw/processed/`.
9. Commit og push, hvis ændringerne er sikre.

# Operation 2: CRM

Når input handler om en kunde/person:

1. Find eller opret fil i `crm/`.
2. Tilføj kontekst, ikke bare rå tekst.
3. Link til relevante wiki-sider, shoots og opgaver.
4. Bevar følsomhed som `sensitivity: confidential`, hvis det handler om kunder.

# Operation 3: Journal

Når input starter med `journal`:

1. Opret dateret note i `journal/`.
2. Bevar brugerens oprindelige formulering.
3. Tilføj eventuelt links til relevante wiki-sider eller CRM-personer.
4. Omskriv ikke journalen til en generisk artikel.

# Operation 4: thellufsenfoto og Hermes

Hermes er parkeret for nu.

`thellufsenfoto-hermes/` bevares som et scoped område, men den primære Mac-baserede Second Brain bruger `raw/`, `wiki/`, `crm/` og `journal/`.

Hvis Hermes senere aktiveres, må den kun arbejde i `thellufsenfoto-hermes/`.

# Git og sikkerhed

- Commit aldrig secrets, tokens eller private API-nøgler.
- Stop ved Git-konflikter.
- Brug private GitHub-repo.
- Auto-backup må gerne køre, men må stoppe hvis secret-scan finder noget mistænkeligt.
