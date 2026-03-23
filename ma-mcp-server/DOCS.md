# Music Assistant MCP Server - Addon Documentation

## What this does

This addon runs a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server that bridges your [Music Assistant](https://music-assistant.io/) instance with AI assistants like Claude.

Once running, you can tell Claude things like:
- *"Play some jazz in the living room"*
- *"What's currently playing?"*
- *"Add this song to my favorites playlist"*

## Prerequisites

- Music Assistant must be installed and running (as HA addon or separate Docker container)
- A long-lived API token from Music Assistant

## Getting a Music Assistant Token

1. Open the Music Assistant web interface
2. Go to **Settings → Profile**
3. Create a new **Long-Lived Token**
4. Copy the token and paste it into the addon configuration

## Configuration

| Option | Description | Example |
|---|---|---|
| `ma_server_url` | URL of your Music Assistant server | `http://homeassistant.local:8095` |
| `ma_token` | Long-lived API token from Music Assistant | `eyJ...` |
| `port` | Port for the MCP HTTP endpoint | `8668` |

## Connecting Claude

### Claude Code (CLI)

```bash
claude mcp add --transport http music-assistant http://homeassistant.local:8668/mcp
```

### Claude Desktop

Claude Desktop requires a stdio bridge. Use `mcp-remote`:

```json
{
  "mcpServers": {
    "music-assistant": {
      "command": "npx",
      "args": [
        "mcp-remote",
        "http://homeassistant.local:8668/mcp"
      ]
    }
  }
}
```

## Troubleshooting

- **"Connection refused"**: Make sure port 8668 is mapped in the addon config and not blocked by a firewall
- **"Authentication failed"**: Regenerate the token in Music Assistant settings
- **"Cannot reach MA server"**: If MA runs as a HA addon, try using `http://YOUR_HA_IP:8095` instead of `homeassistant.local`
