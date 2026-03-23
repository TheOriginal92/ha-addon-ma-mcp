ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install Python and dependencies
RUN apk add --no-cache python3 py3-pip curl bash jq

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Install music-assistant-mcp into a venv
RUN uv venv /opt/venv && \
    uv pip install \
      --python /opt/venv/bin/python \
      --index-strategy unsafe-best-match \
      music-assistant-mcp

# Copy startup script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
