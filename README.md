# Home Assistant Addon: Music Assistant MCP Server

A Home Assistant addon that runs an MCP (Model Context Protocol) server for [Music Assistant](https://music-assistant.io/), enabling AI assistants like Claude to control your music.

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**
2. Click the **⋮** menu (top right) → **Custom repositories**
3. Add this repository URL: `[https://github.com/YOUR_GITHUB_USERNAME/ha-addon-ma-mcp](https://github.com/TheOriginal92/ha-addon-ma-mcp)`
4. Find **"Music Assistant MCP Server"** in the store and install it
5. Configure `ma_server_url` and `ma_token` in the addon settings
6. Start the addon

See [DOCS.md](ma-mcp-server/DOCS.md) for full documentation including how to connect Claude.

## Based on

[MA_MCP_Docker](https://github.com/devjourney/MA_MCP_Docker) by devjourney, MIT License.

## License

MIT
