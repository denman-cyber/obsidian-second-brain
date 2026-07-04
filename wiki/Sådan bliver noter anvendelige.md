---
type: system_note
status: active
sensitivity: private
ai_lock: false
---

# Sådan bliver noter anvendelige

En god note skal ikke bare gemme information. Den skal hjælpe dig med at handle, huske eller beslutte noget.

## Fra rå input til brugbar note

Når noget lander i `00_Inbox` eller `10_Knowledge/Sources`, skal det vurderes:

1. Er det en opgave?
   - Flyt til dagens note eller `50_Tasks`.

2. Er det et projekt?
   - Opret eller opdater en note i `20_Projects`.

3. Er det en kunde eller relation?
   - Opret eller opdater `30_Areas/CRM`.

4. Er det viden?
   - Lav en kort note i `10_Knowledge/Notes`.

5. Er det ikke nyttigt?
   - Flyt til `90_Archive`.

## En anvendelig vidensnote

Brug denne struktur:

```markdown
## Kort svar
Hvad er pointen?

## Hvorfor det er nyttigt
Hvor kan jeg bruge det?

## Mine noter
Hvad tænker jeg selv?

## Links
Hvilke projekter, kunder eller emner hænger det sammen med?

## Kilder
Hvor kom det fra?
```

## Linking-regel

Hver vigtig note bør linke til mindst én af disse:

- et projekt
- en kunde
- et område
- en kilde
- en opgave

Hvis en note ikke kan linkes til noget, er den måske bare arkiv.
