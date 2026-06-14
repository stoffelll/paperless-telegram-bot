#!/bin/bash

export TELEGRAM_BOT_TOKEN=$(python -c "import json; print(json.load(open('/data/options.json'))['TELEGRAM_BOT_TOKEN'])")
export PAPERLESS_URL=$(python -c "import json; print(json.load(open('/data/options.json'))['PAPERLESS_URL'])")
export PAPERLESS_TOKEN=$(python -c "import json; print(json.load(open('/data/options.json'))['PAPERLESS_TOKEN'])")

python -m paperless_bot
