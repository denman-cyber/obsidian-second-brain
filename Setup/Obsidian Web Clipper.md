# Obsidian Web Clipper

Web Clipper skal gemme alt ubehandlet webmateriale i:

```text
raw/
```

Din vault hedder:

```text
Second brain
```

## Anbefalet opsætning

Åbn Web Clipper extensionens settings og brug:

```text
Vault: Second brain
Note location / Folder: raw
```

Hvis den beder om en note-template, så brug en simpel kilde-template med:

```markdown
---
type: source
source_type: web
source_url: {{url}}
title: {{title}}
captured: {{date}}
status: raw
sensitivity: private
ai_lock: false
---

# {{title}}

## Kilde
{{url}}

## Indhold
{{content}}

## Mine noter
- 

## Skal behandles til
- [ ] Wiki
- [ ] CRM
- [ ] Opgave
- [ ] Arkiv
```

## Test

1. Åbn en almindelig webside i browseren.
2. Klik på Obsidian Web Clipper.
3. Tjek at vault er `Second brain`.
4. Tjek at destination er `raw`.
5. Gem siden.
6. Åbn Obsidian og kig i `raw/`.

Hvis det virker, skal der ligge en ny `.md`-fil i `raw/`.

## YouTube

Ved YouTube-videoer skal clipperen også gemme i `raw/`.

Hvis den kan hente transcript, er det perfekt. Hvis ikke, gemmer den stadig titel og link, og automationen kan senere lave en wiki-note ud fra det materiale, der er tilgængeligt.

## Hvorfor ikke direkte i `wiki/`?

`wiki/` er til bearbejdet viden. Web Clipper gemmer rå input.

Flowet er:

```text
Web/YouTube -> raw/ -> wiki/ -> raw/processed/
```
