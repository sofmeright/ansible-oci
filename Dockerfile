FROM python:3.14.3-alpine3.23

# ============================================================================
# Metadata
# ============================================================================
LABEL maintainer="HomeLabHD <homelabhelp@gmail.com>" \
    org.opencontainers.image.title="ansible" \
    org.opencontainers.image.description="A lightweight Alpine-based Ansible image with core system tools, Windows support (via pywinrm), and essential community collections preinstalled." \
    org.opencontainers.image.source="https://github.com/HomeLabHD/ansible" \
    org.opencontainers.image.url="https://hub.docker.com/r/hlhd/ansible" \
    org.opencontainers.image.documentation="https://github.com/HomeLabHD/ansible#readme" \
    org.opencontainers.image.licenses="GPL-3.0" \
    org.opencontainers.image.vendor="HomeLabHD"

# ============================================================================
# Versions
# ============================================================================
ARG YQ_VERSION=v4.52.5
ARG SOPS_VERSION=v3.12.2
ARG ANSIBLE_CORE_VERSION=2.20.4
ARG ANSIBLE_LINT_VERSION=26.3.0

# ============================================================================
# Environment
# ============================================================================
ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /app

# ============================================================================
# System packages
# ============================================================================
RUN apk upgrade --no-cache && \
    apk add --no-cache \
    bash \
    coreutils \
    curl \
    git \
    jq \
    openssh \
    openssh-keygen \
    rage \
    rsync

# ============================================================================
# Binary tools (yq, sops)
# ============================================================================
RUN curl -fsSL "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq && \
    curl -fsSL "https://github.com/getsops/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.amd64" -o /usr/local/bin/sops && \
    chmod +x /usr/local/bin/yq /usr/local/bin/sops

# ============================================================================
# Python packages
# ============================================================================
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir \
    ansible-core==${ANSIBLE_CORE_VERSION} \
    ansible-lint==${ANSIBLE_LINT_VERSION} \
    hvac \
    kubernetes \
    pywinrm \
    requests

# ============================================================================
# Ansible collections
# ============================================================================
RUN ansible-galaxy collection install \
    ansible.posix \
    ansible.windows \
    community.docker \
    community.hashi_vault \
    community.sops \
    kubernetes.core

# ============================================================================
# Default command
# ============================================================================
CMD ["ansible-playbook", "--version"]
