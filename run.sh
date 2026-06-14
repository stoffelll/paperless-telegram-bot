#!/bin/bash

export TELEGRAM_BOT_TOKEN=$(jq -r '.TELEGRAM_BOT_TOKEN' /data/options.json)
export PAPERLESS_URL=$(jq -r '.PAPERLESS_URL' /data/options.json)
export PAPERLESS_TOKEN=$(jq -r '.PAPERLESS_TOKEN' /data/options.json)

python -m paperless_bot
