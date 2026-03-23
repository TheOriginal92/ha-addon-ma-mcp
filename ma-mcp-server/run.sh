#!/usr/bin/env bashio
set -e

bashio::log.info "Starting Music Assistant MCP Server..."

MA_SERVER_URL=$(bashio::config 'ma_server_url')
MA_TOKEN=$(bashio::config 'ma_token')
PORT=$(bashio::config 'port')

if bashio::var.is_empty "${MA_SERVER_URL}"; then
    bashio::log.fatal "ma_server_url is not set!"
    exit 1
fi

if bashio::var.is_empty "${MA_TOKEN}"; then
    bashio::log.fatal "ma_token is not set!"
    exit 1
fi

export MA_SERVER_URL="${MA_SERVER_URL}"
export MA_TOKEN="${MA_TOKEN}"

# FastMCP reads these environment variables for transport config
export FASTMCP_TRANSPORT="streamable-http"
export FASTMCP_HOST="0.0.0.0"
export FASTMCP_PORT="${PORT}"

bashio::log.info "Connecting to Music Assistant at: ${MA_SERVER_URL}"
bashio::log.info "MCP endpoint will be available at: http://$(hostname):${PORT}/mcp"

exec /opt/venv/bin/music-assistant-mcp
