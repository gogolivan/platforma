FROM mcr.microsoft.com/devcontainers/base:bookworm

WORKDIR /workspace

COPY --chown=vscode:vscode ../../.git/. /workspace/.git
COPY --chown=vscode:vscode ../../platforma-actions/ /workspace/platforma-actions/

COPY scripts/firewall.sh /usr/local/bin/

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
  iptables \
  ipset \
  dnsutils \
  aggregate \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY scripts/post-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/post-start.sh

# Enable firewall
RUN chmod +x /usr/local/bin/firewall.sh && \
  echo "vscode ALL=(root) NOPASSWD: /usr/local/bin/firewall.sh" > /etc/sudoers.d/firewall.sh && \
  chmod 0440 /etc/sudoers.d/firewall.sh

USER vscode