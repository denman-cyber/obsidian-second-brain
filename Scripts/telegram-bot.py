#!/usr/bin/env python3
import json
import os
import subprocess
import time
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Optional


VAULT_DIR = Path(os.environ.get("SECOND_BRAIN_VAULT", "/Users/christian/Documents/Codex/Second brain"))
COMMAND_SCRIPT = Path(os.environ.get("SECOND_BRAIN_COMMAND_SCRIPT", str(VAULT_DIR / "Scripts" / "second-brain-command.sh")))
ENV_FILE = Path(os.environ.get("SECOND_BRAIN_ENV", Path.home() / ".second-brain.env"))


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


def handle_message(chat_id: int, text: str) -> None:
    allowed_prefixes = ("todo ", "done ", "note ", "web ", "youtube ", "plan i morgen ", "shoot ", "kunde ")
    lower = text.lower()

    if lower in ("/start", "start", "hjælp", "help"):
        send_message(
            chat_id,
            "Skriv fx: todo Ring til kunde, note Ide, web https://..., youtube https://..., shoot Kunde X, eller kunde Kunde X.",
        )
        return

    commands = split_commands(text)
    invalid = [command for command in commands if not command.lower().startswith(allowed_prefixes)]

    if not commands or invalid:
        send_message(chat_id, "Jeg forstod ikke kommandoen. Brug todo, done, note, plan i morgen, shoot eller kunde.")
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
                if chat_id and text:
                    handle_message(chat_id, text.strip())
        except KeyboardInterrupt:
            raise
        except Exception as exc:
            print(f"Bot-fejl: {exc}")
            time.sleep(5)


if __name__ == "__main__":
    main()
