#!/usr/bin/env python3
import json
import os
import subprocess
import time
import urllib.parse
import urllib.request
import uuid
from pathlib import Path
from typing import Optional


VAULT_DIR = Path(os.environ.get("SECOND_BRAIN_VAULT", "/Users/christian/Documents/Codex/Second brain"))
COMMAND_SCRIPT = Path(os.environ.get("SECOND_BRAIN_COMMAND_SCRIPT", str(VAULT_DIR / "Scripts" / "second-brain-command.sh")))
ENV_FILE = Path(os.environ.get("SECOND_BRAIN_ENV", Path.home() / ".second-brain.env"))
VOICE_DIR = Path(os.environ.get("SECOND_BRAIN_VOICE_DIR", "/tmp/second-brain-voice"))
TRANSCRIPTION_MODEL = os.environ.get("OPENAI_TRANSCRIPTION_MODEL", "whisper-1")


def load_env_file(path: Path) -> None:
    if not path.exists():
        return
    for raw_line in path.read_text().splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        os.environ.setdefault(key.strip(), value.strip().strip('"').strip("'"))


def api_url(method: str) -> str:
    token = os.environ["TELEGRAM_BOT_TOKEN"]
    return f"https://api.telegram.org/bot{token}/{method}"


def telegram_request(method: str, data: Optional[dict] = None) -> dict:
    encoded = None
    if data is not None:
        encoded = urllib.parse.urlencode(data).encode()
    with urllib.request.urlopen(api_url(method), data=encoded, timeout=60) as response:
        return json.loads(response.read().decode())


def telegram_file_url(file_path: str) -> str:
    token = os.environ["TELEGRAM_BOT_TOKEN"]
    return f"https://api.telegram.org/file/bot{token}/{file_path}"


def send_message(chat_id: int, text: str) -> None:
    telegram_request("sendMessage", {"chat_id": chat_id, "text": text[:3900]})


def split_commands(text: str) -> list:
    return [line.strip() for line in text.splitlines() if line.strip()]


def run_command(command: str) -> str:
    result = subprocess.run(
        [str(COMMAND_SCRIPT), command],
        cwd=str(VAULT_DIR),
        text=True,
        capture_output=True,
        check=False,
    )
    return result.stdout.strip() or result.stderr.strip() or "Kommando behandlet."


def download_telegram_file(file_id: str, suffix: str = ".ogg") -> Path:
    VOICE_DIR.mkdir(parents=True, exist_ok=True)
    file_data = telegram_request("getFile", {"file_id": file_id})
    file_path = file_data.get("result", {}).get("file_path")
    if not file_path:
        raise RuntimeError("Telegram kunne ikke finde lydfilen.")

    target = VOICE_DIR / f"{uuid.uuid4().hex}{suffix}"
    with urllib.request.urlopen(telegram_file_url(file_path), timeout=60) as response:
        target.write_bytes(response.read())
    return target


def multipart_form_data(fields: dict, files: dict) -> tuple:
    boundary = f"----second-brain-{uuid.uuid4().hex}"
    body = bytearray()

    for name, value in fields.items():
        body.extend(f"--{boundary}\r\n".encode())
        body.extend(f'Content-Disposition: form-data; name="{name}"\r\n\r\n'.encode())
        body.extend(str(value).encode())
        body.extend(b"\r\n")

    for name, file_info in files.items():
        filename, content_type, content = file_info
        body.extend(f"--{boundary}\r\n".encode())
        body.extend(f'Content-Disposition: form-data; name="{name}"; filename="{filename}"\r\n'.encode())
        body.extend(f"Content-Type: {content_type}\r\n\r\n".encode())
        body.extend(content)
        body.extend(b"\r\n")

    body.extend(f"--{boundary}--\r\n".encode())
    return bytes(body), f"multipart/form-data; boundary={boundary}"


def transcribe_audio(path: Path) -> str:
    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key:
        raise RuntimeError(f"Mangler OPENAI_API_KEY i {ENV_FILE}")

    fields = {
        "model": os.environ.get("OPENAI_TRANSCRIPTION_MODEL", TRANSCRIPTION_MODEL),
        "language": os.environ.get("OPENAI_TRANSCRIPTION_LANGUAGE", "da"),
        "response_format": "json",
    }
    files = {
        "file": (path.name, "audio/ogg", path.read_bytes()),
    }
    body, content_type = multipart_form_data(fields, files)
    request = urllib.request.Request(
        "https://api.openai.com/v1/audio/transcriptions",
        data=body,
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": content_type,
        },
        method="POST",
    )

    with urllib.request.urlopen(request, timeout=120) as response:
        data = json.loads(response.read().decode())
    text = (data.get("text") or "").strip()
    if not text:
        raise RuntimeError("OpenAI returnerede ingen transskription.")
    return text


def handle_transcribed_text(chat_id: int, text: str) -> None:
    allowed_prefixes = ("todo ", "done ", "note ", "web ", "youtube ", "journal ", "plan i morgen ", "shoot ", "kunde ")
    command_text = text.strip()
    if not command_text.lower().startswith(allowed_prefixes):
        command_text = f"note {command_text}"

    commands = split_commands(command_text)
    replies = [run_command(command) for command in commands]
    reply = "Transskriberet:\n" + text + "\n\n" + "\n\n".join(replies)
    send_message(chat_id, reply)


def handle_voice_message(chat_id: int, message: dict) -> None:
    audio = message.get("voice") or message.get("audio")
    if not audio:
        return

    file_id = audio.get("file_id")
    mime_type = audio.get("mime_type", "audio/ogg")
    suffix = ".ogg"
    if "mpeg" in mime_type or "mp3" in mime_type:
        suffix = ".mp3"
    elif "m4a" in mime_type or "mp4" in mime_type:
        suffix = ".m4a"

    if not file_id:
        send_message(chat_id, "Jeg kunne ikke finde lydfilen i Telegram-beskeden.")
        return

    try:
        audio_path = download_telegram_file(file_id, suffix=suffix)
        transcript = transcribe_audio(audio_path)
        handle_transcribed_text(chat_id, transcript)
    except Exception as exc:
        send_message(chat_id, f"Voice-beskeden kunne ikke transskriberes: {exc}")


def handle_message(chat_id: int, text: str) -> None:
    allowed_prefixes = ("todo ", "done ", "note ", "web ", "youtube ", "journal ", "plan i morgen ", "shoot ", "kunde ")
    lower = text.lower()

    if lower in ("/start", "start", "hjælp", "help"):
        send_message(
            chat_id,
            "Skriv eller indtal fx: todo Ring til kunde, note Ide, journal Jeg tænker..., shoot Kunde X, eller kunde Kunde X.",
        )
        return

    commands = split_commands(text)
    invalid = [command for command in commands if not command.lower().startswith(allowed_prefixes)]

    if not commands or invalid:
        send_message(chat_id, "Jeg forstod ikke kommandoen. Brug todo, done, note, web, youtube, journal, plan i morgen, shoot eller kunde.")
        return

    replies = [run_command(command) for command in commands]
    reply = "\n\n".join(replies)
    send_message(chat_id, reply)


def main() -> None:
    load_env_file(ENV_FILE)
    if not os.environ.get("TELEGRAM_BOT_TOKEN"):
        raise SystemExit(f"Mangler TELEGRAM_BOT_TOKEN i {ENV_FILE}")

    offset = 0
    print("Telegram bot kører. Stop med Ctrl+C.")
    while True:
        try:
            data = telegram_request("getUpdates", {"timeout": 50, "offset": offset})
            for update in data.get("result", []):
                offset = update["update_id"] + 1
                message = update.get("message") or {}
                chat = message.get("chat") or {}
                text = message.get("text")
                chat_id = chat.get("id")
                if chat_id and (message.get("voice") or message.get("audio")):
                    handle_voice_message(chat_id, message)
                elif chat_id and text:
                    handle_message(chat_id, text.strip())
        except KeyboardInterrupt:
            raise
        except Exception as exc:
            print(f"Bot-fejl: {exc}")
            time.sleep(5)


if __name__ == "__main__":
    main()
