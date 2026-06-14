#!/bin/bash

export TELEGRAM_BOT_TOKEN=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['TELEGRAM_BOT_TOKEN'])")
export PAPERLESS_URL=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['PAPERLESS_URL'])")
export PAPERLESS_TOKEN=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin)['PAPERLESS_TOKEN'])")
export TELEGRAM_ALLOWED_USERS=$(cat /data/options.json | python -c "import sys,json; print(json.load(sys.stdin).get('TELEGRAM_ALLOWED_USERS',''))")

exec su -s /bin/sh -c "
  export TELEGRAM_BOT_TOKEN='$TELEGRAM_BOT_TOKEN'
  export PAPERLESS_URL='$PAPERLESS_URL'
  export PAPERLESS_TOKEN='$PAPERLESS_TOKEN'
  export TELEGRAM_ALLOWED_USERS='$TELEGRAM_ALLOWED_USERS'
  python -m paperless_bot
" paperlessbot
