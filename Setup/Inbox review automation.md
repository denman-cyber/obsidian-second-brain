# Raw to Wiki Automation

Denne automation kører hver 4. time og holder Second Brain selvopretholdende.

## Hovedopgave

Behandl nyt materiale i:

```text
raw/
```

og omsæt det til:

```text
wiki/
crm/
journal/
daily/
index.md
log.md
```

Når en rå fil er behandlet, flyttes den til:

```text
raw/processed/
```

## Den må gerne

- læse nye filer i `raw/`
- oprette eller opdatere wiki-sider i `wiki/`
- udtrække centrale begreber, personer, værktøjer og temaer
- lave wikilinks mellem relaterede wiki-sider
- oprette eller opdatere kunder/personer i `crm/`
- opdatere `index.md`
- skrive rapport i `80_AI-Review/`
- flytte færdigbehandlede rå filer til `raw/processed/`

## Den må ikke

- slette rå kilder permanent
- omskrive journalnoter hårdt
- ændre filer med `ai_lock: true`
- gætte på følsomme kundeoplysninger
- behandle uklart materiale som fakta

## Wiki-standard

En wiki-side bør have:

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

## Rapport

Hver kørsel skal skrive en kort rapport i `80_AI-Review/`:

- rå filer behandlet
- wiki-sider oprettet eller opdateret
- CRM-sider oprettet eller opdateret
- links tilføjet
- filer flyttet til `raw/processed/`
- ting der kræver manuel beslutning
