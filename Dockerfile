FROM python:3.13.5-alpine3.22

LABEL maintainer="sofmeright@gmail.com"

WORKDIR /app
ADD . /app

# Set SSH behavior
ENV ANSIBLE_HOST_KEY_CHECKING=False

# Install system tools
RUN apk add --no-cache \
    bash \
    coreutils \
    curl \
    git \
    openssh \
    openssh-keygen \
    rage \
    rsync

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install \
    requests \
    ansible-core==2.18.7 \
    ansible-lint==25.7.0 \
    pywinrm

# Install Ansible collections
RUN ansible-galaxy collection install \
    ansible.posix \
    ansible.windows \
    community.docker

# Install SOPS (v3.10.2)
RUN curl -LO https://github.com/getsops/sops/releases/download/v3.10.2/sops-v3.10.2.linux.amd64 && \
    mv sops-v3.10.2.linux.amd64 /usr/local/bin/sops && \
    chmod +x /usr/local/bin/sops

CMD [ "ansible-playbook", "--version" ]
