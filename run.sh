#!/bin/bash

# Optionen als Root auslesen
export TELEGRAM_BOT_TOKEN=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['TELEGRAM_BOT_TOKEN'])")
export PAPERLESS_URL=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['PAPERLESS_URL'])")
export PAPERLESS_TOKEN=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['PAPERLESS_TOKEN'])")

# Als paperlessbot User starten mit den Umgebungsvariablen
exec su -s /bin/sh -c "
  export TELEGRAM_BOT_TOKEN='$TELEGRAM_BOT_TOKEN'
  export PAPERLESS_URL='$PAPERLESS_URL'
  export PAPERLESS_TOKEN='$PAPERLESS_TOKEN'
  python -m paperless_bot
" paperlessbot
