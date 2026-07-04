# Start Her

Dette er den enkle måde at bruge din Second Brain på.

Hovedsystemet er:

```text
raw/ -> wiki/ -> index.md
```

Alt ubehandlet lander i `raw/`. Automation behandler rå input, laver eller opdaterer sider i `wiki/`, linker noter sammen, flytter færdige rå kilder til `raw/processed/` og opdaterer `index.md`.

## Dagligt

Brug Telegram til hurtige ting:

```text
todo Ring til kunde
done Ring til kunde
plan i morgen Følg op på tilbud
note Husk ideen om en ny foto-pakke
```

Hvis du sender flere ting i samme Telegram-besked, så brug én kommando pr. linje.

Kig i:

- [[40_Daily/2026-07-04]]
- [[raw]]

## Web og YouTube

Gem ting hurtigt:

```text
web https://example.com Artikel om markedsføring
youtube https://youtube.com/... Video om portrætlys
```

Hvis du bruger Obsidian Web Clipper, skal den gemme i `raw/`.

Se: [[Setup/Obsidian Web Clipper]]

De lander i:

```text
raw/
```

Når en kilde er nyttig, laves den om til en kort anvendelig note i:

```text
wiki/
```

Se også: [[wiki/Sådan bliver noter anvendelige]]

## Kunder og CRM

Brug:

```text
kunde Kunde Jensen, ønsker portrætter til hjemmeside
```

Kundekort lander i:

```text
crm/
```

## Fotoopgaver

Brug:

```text
shoot Kunde Jensen, lørdag kl 10, portrætter i naturligt lys
```

Shoot briefs lander i:

```text
raw/
```

Automation kan derefter lave eller opdatere relevante wiki- og CRM-sider.

## Journal

Brug:

```text
journal Jeg tænker på...
```

Journalnoter lander i:

```text
journal/
```

## Ugentlig oprydning

En gang om ugen:

1. Kig i `raw`.
2. Kig i `80_AI-Review`.
3. Godkend, ret eller arkiver forslag.
4. Vælg næste uges vigtigste projekter.

## Automatisk inbox review

Der kører et forsigtigt review-job hver 4. time, som hjælper med at gøre `raw/`, webkilder og YouTube-kilder mere søgbare og anvendelige.

Se: [[Setup/Inbox review automation]]

## Reglen

Systemet skal gøre ting nemmere. Hvis en mappe eller automation begynder at føles tung, forenkler vi.
