FROM mcr.microsoft.com/devcontainers/base:bookworm

WORKDIR /workspace

COPY --chown=vscode:vscode ../../.git/. /workspace/.git
COPY --chown=vscode:vscode ../../platforma-catalog/ /workspace/platforma-catalog/

USER root

COPY scripts/post-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/post-start.sh

USER vscode