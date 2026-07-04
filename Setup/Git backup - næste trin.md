# Git backup - næste trin

Git er backup- og historiklaget. Det betyder, at vi kan se ændringer over tid og senere synkronisere sikkert med GitHub.

## Hvad der mangler

Maskinen mangler Git-navn og Git-email. Det skal sættes, før vi laver første commit.

## Beslutninger

Vælg:

- Navn til Git commits
- Email til Git commits
- Om GitHub-repoet skal hedde `second-brain`, `obsidian-second-brain` eller noget andet

## Anbefaling

Brug et privat GitHub-repo.

Automatisk sync bør først aktiveres, når:

- første manuelle commit virker
- push til GitHub virker
- Obsidian åbner vaulten korrekt
- Telegram-flowet er testet lokalt

## Sikkerhedsregler

- Secrets og tokens må ikke ligge i vaulten.
- `.env` og nøglefiler er ignoreret af `.gitignore`.
- Hermes/VPS skal senere kun committe `thellufsenfoto-hermes/`.
