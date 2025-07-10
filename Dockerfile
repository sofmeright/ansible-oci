FROM python:3.13.5-alpine3.22
WORKDIR /app
ADD . /app
ENV ANSIBLE_HOST_KEY_CHECKING 'false'
RUN apk add --no-cache openssh-client rsync
RUN pip3 install --upgrade pip
RUN pip3 install requests ansible-core==2.18.6 ansible-lint==25.6.1 pywinrm
RUN ansible-galaxy collection install ansible.posix
RUN ansible-galaxy collection install ansible.windows
RUN ansible-galaxy collection install community.docker
CMD [ "ansible-playbook", "--version" ]