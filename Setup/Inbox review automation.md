# Inbox review automation

Denne automation skal køre hver 4. time og gøre nye noter mere anvendelige.

## Formål

Automationens opgave er ikke bare at rydde op. Den skal gøre noter søgbare, linkede og brugbare.

## Den må gerne

- gennemgå `00_Inbox`
- gennemgå nye kilder i `10_Knowledge/Sources`
- foreslå eller oprette en bedre placering
- lave korte, anvendelige noter i `10_Knowledge/Notes`
- oprette opgaver i `50_Tasks`, hvis noget tydeligt er en opgave
- oprette eller opdatere kundekort i `30_Areas/CRM`
- linke relevante noter sammen med wikilinks
- flytte tydeligt behandlede rå noter til `90_Archive/Processed`
- skrive en kort rapport i `80_AI-Review`

## Den må ikke

- slette noter permanent
- omskrive private noter hårdt
- ændre filer med `ai_lock: true`
- gætte på følsomme kundeoplysninger
- flytte noget uklart uden at lægge en note i `80_AI-Review`

## Hvad en behandlet note skal have

Når en note bliver gjort anvendelig, bør den have:

- tydelig titel
- YAML-frontmatter
- status
- type
- kilde eller oprindelse
- relevante wikilinks
- en kort forklaring på hvorfor noten er nyttig
- næste handling, hvis der er en

## Review-rapport

Hver kørsel bør skrive en rapport i:

```text
80_AI-Review/
```

Rapporten skal vise:

- hvilke filer der blev behandlet
- hvad der blev flyttet eller oprettet
- hvad der kræver manuel beslutning
- om der var noget, der blev sprunget over
