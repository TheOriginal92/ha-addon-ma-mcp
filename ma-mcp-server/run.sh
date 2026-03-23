#!/usr/bin/env bashio
set -e

bashio::log.info "Starting Music Assistant MCP Server..."

# Read configuration from Home Assistant options
MA_SERVER_URL=$(bashio::config 'ma_server_url')
MA_TOKEN=$(bashio::config 'ma_token')
PORT=$(bashio::config 'port')

# Validate required config
if bashio::var.is_empty "${MA_SERVER_URL}"; then
    bashio::log.fatal "ma_server_url is not set! Please configure the addon."
    exit 1
fi

if bashio::var.is_empty "${MA_TOKEN}"; then
    bashio::log.fatal "ma_token is not set! Please generate a token in Music Assistant (Settings → Profile) and configure the addon."
    exit 1
fi

# Export as environment variables for the MCP server
export MA_SERVER_URL="${MA_SERVER_URL}"
export MA_TOKEN="${MA_TOKEN}"

bashio::log.info "Connecting to Music Assistant at: ${MA_SERVER_URL}"
bashio::log.info "MCP endpoint will be available at: http://$(hostname):${PORT}/mcp"

# Start the MCP server
# The music-assistant-mcp package exposes a CLI entrypoint
exec music-assistant-mcp \
    --transport streamable-http \
    --host 0.0.0.0 \
    --port "${PORT}"
