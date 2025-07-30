FROM python:3.13.5-alpine3.22

WORKDIR /app
ADD . /app

# Set SSH behavior
ENV ANSIBLE_HOST_KEY_CHECKING=False

# Install system tools
RUN apk add --no-cache \
    bash \
    curl \
    openssh \
    openssh-keygen \
    rsync

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install \
    requests \
    ansible-core==2.18.6 \
    ansible-lint==25.6.1 \
    pywinrm

# Install Ansible collections
RUN ansible-galaxy collection install \
    ansible.posix \
    ansible.windows \
    community.docker

CMD [ "ansible-playbook", "--version" ]