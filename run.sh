#!/bin/bash

# Optionen als Root auslesen
TELEGRAM_BOT_TOKEN=$(python -c "import json; print(json.load(open('/data/options.json'))['TELEGRAM_BOT_TOKEN'])")
PAPERLESS_URL=$(python -c "import json; print(json.load(open('/data/options.json'))['PAPERLESS_URL'])")
PAPERLESS_TOKEN=$(python -c "import json; print(json.load(open('/data/options.json'))['PAPERLESS_TOKEN'])")

export TELEGRAM_BOT_TOKEN
export PAPERLESS_URL
export PAPERLESS_TOKEN

# Als originaler User (appuser) die App starten
su -s /bin/bash -c 'export TELEGRAM_BOT_TOKEN="'"$TELEGRAM_BOT_TOKEN"'" PAPERLESS_URL="'"$PAPERLESS_URL"'" PAPERLESS_TOKEN="'"$PAPERLESS_TOKEN"'"; python -m paperless_bot' appuser
