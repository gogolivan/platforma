FROM mcr.microsoft.com/devcontainers/base:alpine

WORKDIR /workspace

COPY --chown=vscode:vscode ../../.git/. /workspace/.git
COPY --chown=vscode:vscode ../../platforma-proto/ /workspace/platforma-proto/

USER vscode