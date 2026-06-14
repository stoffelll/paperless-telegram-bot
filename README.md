# Home Assistant Add-on: Paperless Telegram Bot

This add-on integrates the `paperless-telegram-bot` into your Home Assistant OS environment. It allows you to send documents and photos directly via Telegram to your Paperless-ngx instance.

## Prerequisites
- A running Paperless-ngx instance.
- A Telegram Bot token (obtained via [@BotFather](https://t.me/botfather)).
- A Paperless-ngx API Token.

## Installation
1. Open your Home Assistant instance.
2. Navigate to **Settings** > **Add-ons**.
3. Click the three dots in the top right corner and select **Repositories**.
4. Add the URL of this repository: `https://github.com/stoffelll/paperless-telegram-bot`
5. Click **Add**, then close the dialog.
6. The "Paperless Telegram Bot" will now appear in the Add-on Store. Install it.

## Configuration
Configure the following options in the **Configuration** tab:

| Option | Description |
| :--- | :--- |
| `TELEGRAM_BOT_TOKEN` | The API token provided by @BotFather. |
| `PAPERLESS_URL` | The internal address of your Paperless-ngx instance (e.g., `http://paperless:8000`). |
| `PAPERLESS_TOKEN` | Your generated API token from Paperless-ngx user settings. |

## Support
This add-on is based on the official image by [GeiserX](https://github.com/GeiserX/paperless-telegram-bot). Please refer to their repository for specific features and bot commands.
