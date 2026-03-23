ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install Python 3.13 and dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    curl \
    bash \
    jq

# Install uv (fast Python package manager, same as original project)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Install music-assistant-mcp from PyPI
RUN uv pip install --system music-assistant-mcp

# Copy startup script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
