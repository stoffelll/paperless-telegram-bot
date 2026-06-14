# Paperless Telegram Bot - Home Assistant Add-on

[![License](https://img.shields.io/github/license/GeiserX/paperless-telegram-bot)](LICENSE)
[![Home Assistant Add-on](https://img.shields.io/badge/Home%20Assistant-Add--on-blue.svg)](https://www.home-assistant.io/)
[![Paperless-ngx](https://img.shields.io/badge/Paperless--ngx-compatible-green.svg)](https://github.com/paperless-ngx/paperless-ngx)

A Home Assistant add-on that integrates [Paperless Telegram Bot](https://github.com/GeiserX/paperless-telegram-bot) into your Home Assistant instance. Send documents directly to your [Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) instance via Telegram — right from your phone.
---

## 📖 Table of Contents

- [About](#about)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Security](#security)
- [Troubleshooting](#troubleshooting)
- [Technical Details](#technical-details)
- [Updating](#updating)
- [Uninstalling](#uninstalling)
- [Contributing](#contributing)
- [Credits](#credits)
- [License](#license)
---

## About

This add-on wraps the [Paperless Telegram Bot](https://github.com/GeiserX/paperless-telegram-bot) by [GeiserX](https://github.com/GeiserX) into a Home Assistant add-on. It allows you to upload documents to your Paperless-ngx instance simply by sending them to a Telegram bot. No need to open a browser or use the Paperless-ngx web interface — just snap a photo or forward a document in Telegram.

This is especially useful for:

- 📱 **Quick document scanning** — Take a photo of a receipt or letter and send it directly to Paperless
- 📎 **Forwarding documents** — Forward PDFs or images from other Telegram chats to your Paperless archive
- 🏠 **Home Assistant integration** — Run everything on your Home Assistant instance without additional servers
---

## Features

- ✅ Upload documents to Paperless-ngx via Telegram
- ✅ Supports multiple file types (PDF, images, and more)
- ✅ User restriction — limit bot access to specific Telegram users
- ✅ Runs as a native Home Assistant add-on
- ✅ Multi-architecture support (amd64, aarch64, armv7)
- ✅ Simple configuration through the Home Assistant UI
- ✅ Built-in health check endpoint
- ✅ Minimal resource usage
---

## Prerequisites

Before installing this add-on, make sure you have:

1. **Home Assistant OS or Supervised** installation (add-ons are not supported on Home Assistant Core or Container)
2. **Paperless-ngx** instance running and accessible from your Home Assistant server
3. **Telegram Bot Token** — Create a bot via [@BotFather](https://t.me/BotFather) on Telegram
4. **Paperless-ngx API Token** — Generate one in your Paperless-ngx admin panel

### How to Get a Telegram Bot Token

1. Open Telegram and search for [@BotFather](https://t.me/BotFather)
2. Send `/newbot`
3. Follow the instructions to choose a name and username
4. Copy the **HTTP API Token** you receive

### How to Get a Paperless-ngx API Token

1. Open your Paperless-ngx web interface
2. Go to **Settings** → **Users & Groups** → click on your user
3. Scroll down and click **Generate Token** (or copy the existing one)
4. Alternatively, navigate directly to: `http://your-paperless-url/api/token/`
---

## Installation

### Step 1: Add the Repository

1. In Home Assistant, navigate to **Settings** → **Add-ons** → **Add-on Store**
2. Click the **⋮** menu (three dots) in the top right corner
3. Select **Repositories**
4. Add the following repository URL:

https://github.com/stoffelll/paperless-telegram-bot

5. Click **Add** → **Close**

### Step 2: Install the Add-on

1. Refresh the Add-on Store page
2. Scroll down or search for **Paperless Telegram Bot**
3. Click on the add-on
4. Click **Install**
5. Wait for the build to complete (this may take a few minutes on first install)

### Step 3: Configure the Add-on

1. After installation, go to the **Configuration** tab
2. Fill in the required fields (see [Configuration](#configuration) below)
3. Click **Save**

### Step 4: Start the Add-on

1. Go back to the **Info** tab
2. Click **Start**
3. Check the **Log** tab to verify the bot started successfully
4. You should see something like:

Paperless Telegram Bot v0.6.1 starting... Health check endpoint running on port 8080 Telegram bot configured Starting Telegram bot polling... Bot commands registered with Telegram
---

## Configuration

### Required Options

| Option | Type | Description |
|---|---|---|
| `TELEGRAM_BOT_TOKEN` | string | Your Telegram Bot API token from [@BotFather](https://t.me/BotFather) |
| `PAPERLESS_URL` | string | The URL of your Paperless-ngx instance (e.g., `http://192.168.1.100:8000`) |
| `PAPERLESS_TOKEN` | string | Your Paperless-ngx API authentication token |

### Optional Options

| Option | Type | Default | Description |
|---|---|---|---|
| `TELEGRAM_ALLOWED_USERS` | string | *(empty)* | Comma-separated list of Telegram user IDs allowed to use the bot. **If left empty, anyone can use your bot!** |

### Example Configuration

```yaml
TELEGRAM_BOT_TOKEN: "1234567890:ABCdefGHIjklMNOpqrsTUVwxyz"
PAPERLESS_URL: "http://192.168.1.100:8000"
PAPERLESS_TOKEN: "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0"
TELEGRAM_ALLOWED_USERS: "123456789,987654321"
```


Finding Your Telegram User ID
Open Telegram
Search for @userinfobot
Send any message to the bot
It will reply with your User ID
Enter this ID in the TELEGRAM_ALLOWED_USERS field
For multiple users, separate IDs with commas: "123456789,987654321"


---

## Usage

Once the bot is running, simply interact with it on Telegram:

### Sending Documents

1. Open your Telegram bot chat
2. Send a document or photo
3. The bot will automatically upload it to Paperless-ngx
4. Paperless-ngx will process, OCR, and archive the document

### Supported File Types

| Type | Formats |
|---|---|
| 📄 Documents | PDF |
| 🖼️ Images | JPG, PNG, TIFF, BMP, GIF, WebP |
| 📝 Other | Depends on your Paperless-ngx configuration |

### Bot Commands

| Command | Description |
|---|---|
| `/start` | Start the bot and see welcome message |
| `/help` | Show available commands and usage instructions |

> **Tip:** You can also forward documents from other Telegram chats directly to the bot!
---

## Security

⚠️ **Important Security Considerations:**

1. **Always set `TELEGRAM_ALLOWED_USERS`** — Without this, anyone who finds your bot can upload documents to your Paperless instance

2. **Keep your tokens secret** — Never share your Telegram Bot Token or Paperless API Token publicly

3. **Use internal network URLs** — If Paperless-ngx runs on the same network, use the local IP address (e.g., `http://192.168.x.x:8000`) instead of exposing it to the internet

4. **Token rotation** — If you suspect a token has been compromised, regenerate it immediately:
   - Telegram: Use `/revoke` in [@BotFather](https://t.me/BotFather)
   - Paperless: Regenerate the token in the admin panel
---

## Troubleshooting

### Bot doesn't start

**Check the logs** in the Add-on → **Log** tab.

| Error Message | Solution |
|---|---|
| `TELEGRAM_BOT_TOKEN is not set` | Make sure you entered the token in the Configuration tab and clicked Save |
| `Connection refused` to Paperless URL | Verify the Paperless URL is correct and reachable from your HA instance |
| `401 Unauthorized` | Your Paperless API token is invalid — regenerate it |
| `Conflict: terminated by other getUpdates request` | Another instance of the same bot is running — stop it first |

### Bot is running but doesn't respond

1. Make sure you're messaging the correct bot
2. Check if your user ID is in `TELEGRAM_ALLOWED_USERS` (if configured)
3. Verify the bot token is correct
4. Check the add-on logs for errors

### Documents are uploaded but not appearing in Paperless

1. Check the Paperless-ngx logs for processing errors
2. Verify the API token has sufficient permissions
3. Make sure the file type is supported by your Paperless installation

### Network issues

If your Paperless-ngx instance runs as a Home Assistant add-on or in Docker on the same machine:

```yaml
# Try using the Docker network hostname
PAPERLESS_URL: "http://paperless:8000"

# Or use the host IP
PAPERLESS_URL: "http://192.168.1.100:8000"

# Or use the Docker gateway
PAPERLESS_URL: "http://172.17.0.1:8000"
```

## Technical Details

### File Structure
paperless_telegram_bot/ 

  ├── config.yaml # Add-on configuration and metadata 

  ├── Dockerfile # Docker build instructions 

  ├── run.sh # Startup script (reads HA options → sets env vars) 
  
└── README.md # This file

### How It Works

1. **Home Assistant** stores the add-on configuration in `/data/options.json` inside the container
2. **`run.sh`** reads the options file and exports the values as environment variables
3. The **Paperless Telegram Bot** application reads these environment variables and starts
4. The bot connects to Telegram via **long polling** and waits for incoming messages
5. When a document is received, it's uploaded to Paperless-ngx via the **REST API**
 Telegram │────▶│ HA Add-on │────▶│ Paperless-ngx│ │ (User) │◀────│ (Telegram Bot) │◀────│ (API) │

### Architecture Support

| Architecture | Supported | Typical Devices |
|---|---|---|
| `amd64` | ✅ | Intel/AMD PCs, NUCs, Proxmox VMs |
| `aarch64` | ✅ | Raspberry Pi 4/5 (64-bit), ODROID |
| `armv7` | ✅ | Raspberry Pi 3 (32-bit), older SBCs |
---

## Updating

When a new version is available:

1. Go to **Settings** → **Add-ons** → **Paperless Telegram Bot**
2. If an update is available, you'll see an **Update** button
3. Click **Update** and wait for the new image to be built
4. The add-on will restart automatically

> **Note:** Your configuration is preserved during updates.

---

## Uninstalling

1. Go to **Settings** → **Add-ons** → **Paperless Telegram Bot**
2. Click **Stop** to stop the add-on
3. Click **Uninstall**
4. Your Paperless-ngx documents are **not affected** — they remain in your Paperless instance
---

## Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** this repository
2. Create a **feature branch** (`git checkout -b feature/my-feature`)
3. **Commit** your changes (`git commit -m 'Add my feature'`)
4. **Push** to the branch (`git push origin feature/my-feature`)
5. Open a **Pull Request**

### Reporting Issues

If you encounter a bug or have a feature request:

1. Check [existing issues](https://github.com/YOUR_USERNAME/YOUR_REPO/issues) first
2. Open a [new issue](https://github.com/YOUR_USERNAME/YOUR_REPO/issues/new) with:
   - A clear description of the problem
   - Your Home Assistant version
   - The add-on logs (from the **Log** tab)
   - Your configuration (⚠️ **remove tokens and sensitive data!**)

---

## Credits

- **[Paperless Telegram Bot](https://github.com/GeiserX/paperless-telegram-bot)** by [GeiserX](https://github.com/GeiserX) — The original bot application
- **[Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx)** — The document management system
- **[Home Assistant](https://www.home-assistant.io/)** — The home automation platform

---

## License

This project is licensed under the [MIT License](LICENSE).

---

<p align="center">
  <i>Made with ❤️ for the Home Assistant community</i>
</p>
