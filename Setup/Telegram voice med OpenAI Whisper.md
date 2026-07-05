# Telegram voice med OpenAI Whisper

Du kan indtale beskeder direkte i Telegram.

Flowet er:

```text
Telegram voice -> OpenAI transcription -> tekstkommando -> Obsidian
```

Hvis den transskriberede tekst starter med en kommando, bruges den direkte:

```text
todo Ring til Allan
journal Jeg tænker på...
shoot Allan Jensen, portrætter på lørdag
kunde Allan Jensen, spurgte til portrætter
```

Hvis du bare indtaler en almindelig tanke uden kommando, gemmes den som:

```text
note [transskription]
```

Det betyder, at den lander i:

```text
raw/
```

## OpenAI API key

Tokenet skal ligge uden for vaulten i:

```text
/Users/christian/.second-brain.env
```

Tilføj:

```bash
OPENAI_API_KEY="din-openai-api-key"
OPENAI_TRANSCRIPTION_MODEL="whisper-1"
OPENAI_TRANSCRIPTION_LANGUAGE="da"
```

`whisper-1` er valgt som standard, fordi du specifikt ønsker Whisper.

OpenAI understøtter også nyere transcription-modeller som `gpt-4o-transcribe` og `gpt-4o-mini-transcribe`, men Whisper er fint til dit første setup.

## Installer opdateret bot

Når API-nøglen er gemt:

```bash
cd "/Users/christian/Documents/Codex/Second brain"
git pull
Scripts/install-telegram-launchagent.sh
```

## Test

Send en voice-besked til Telegram-botten:

```text
note Det her er en test af voice til Second Brain
```

Eller sig bare:

```text
Det her er en almindelig tanke uden kommando
```

Så skal den lande som en raw note.

## Kilder

- OpenAI Speech to text guide: https://platform.openai.com/docs/guides/speech-to-text
- OpenAI transcription API reference: https://platform.openai.com/docs/api-reference/audio/createTranscription
