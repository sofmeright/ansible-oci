FROM python:3.14.2-alpine3.23

# ============================================================================
# Metadata
# ============================================================================
LABEL maintainer="SoFMeRight <sofmeright@gmail.com>" \
    org.opencontainers.image.title="ansible-oci" \
    org.opencontainers.image.description="A lightweight Alpine-based Ansible image with core system tools, Windows support (via pywinrm), and essential community collections preinstalled." \
    org.opencontainers.image.source="https://github.com/sofmeright/ansible-oci" \
    org.opencontainers.image.url="https://hub.docker.com/r/prplanit/ansible-oci" \
    org.opencontainers.image.documentation="https://github.com/sofmeright/ansible-oci#readme" \
    org.opencontainers.image.licenses="GPL-3.0" \
    org.opencontainers.image.vendor="SoFMeRight"

# ============================================================================
# Versions
# ============================================================================
ARG YQ_VERSION=v4.50.1
ARG SOPS_VERSION=v3.11.0
ARG ANSIBLE_CORE_VERSION=2.20.1
ARG ANSIBLE_LINT_VERSION=26.1.0

# ============================================================================
# Environment
# ============================================================================
ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /app

# ============================================================================
# System packages
# ============================================================================
RUN apk add --no-cache \
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
    pywinrm \
    requests

# ============================================================================
# Ansible collections
# ============================================================================
RUN ansible-galaxy collection install \
    ansible.posix \
    ansible.windows \
    community.docker \
    community.sops \
    kubernetes.core

# ============================================================================
# Default command
# ============================================================================
CMD ["ansible-playbook", "--version"]