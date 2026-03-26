# Ansible

A lightweight, production-ready Ansible Docker image built on `python:3.14.3-alpine3.23`. Designed for running playbooks in CI/CD pipelines or local automation tasks. Powered by Ansible 2.20.3, pre-loaded with common community collections and WinRM support for managing Windows nodes.

<!-- sf:project:start -->
[![badge/GitHub-source-181717?logo=github](https://img.shields.io/badge/GitHub-source-181717?logo=github)](https://github.com/HomeLabHD/ansible) [![badge/GitLab-source-FC6D26?logo=gitlab](https://img.shields.io/badge/GitLab-source-FC6D26?logo=gitlab)](https://gitlab.prplanit.com/PrPlanIT/HomeLabHD/ansible) [![Last Commit](https://img.shields.io/github/last-commit/HomeLabHD/ansible)](https://github.com/HomeLabHD/ansible/commits) [![Open Issues](https://img.shields.io/github/issues/HomeLabHD/ansible)](https://github.com/HomeLabHD/ansible/issues) ![github/issues-pr/HomeLabHD/ansible](https://img.shields.io/github/issues-pr/HomeLabHD/ansible) [![Contributors](https://img.shields.io/github/contributors/HomeLabHD/ansible)](https://github.com/HomeLabHD/ansible/graphs/contributors)
<!-- sf:project:end -->
<!-- sf:badges:start -->
[![build](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/build.svg)](https://gitlab.prplanit.com/PrPlanIT/HomeLabHD/ansible/-/pipelines) [![license](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/license.svg)](https://github.com/HomeLabHD/ansible/blob/main/LICENSE) [![release](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/release.svg)](https://github.com/HomeLabHD/ansible/releases) ![updated](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/updated.svg) [![badge/donate-FF5E5B?logo=ko-fi&logoColor=white](https://img.shields.io/badge/donate-FF5E5B?logo=ko-fi&logoColor=white)](https://ko-fi.com/T6T41IT163) [![badge/sponsor-EA4AAA?logo=githubsponsors&logoColor=white](https://img.shields.io/badge/sponsor-EA4AAA?logo=githubsponsors&logoColor=white)](https://github.com/sponsors/HomeLabHD)
<!-- sf:badges:end -->
<!-- sf:image:start -->
[![badge/Docker-hlhd%2Fansible-2496ED?logo=docker&logoColor=white](https://img.shields.io/badge/Docker-hlhd%2Fansible-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/hlhd/ansible) [![pulls](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/pulls.svg)](https://hub.docker.com/r/hlhd/ansible)

[![latest](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/latest.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest) ![updated](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/release-updated.svg) [![size](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/release-size.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=2.20.1) [![latest-dev](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/latest-dev.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest-dev) ![updated](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/dev-updated.svg) [![size](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/dev-size.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest-dev)
<!-- sf:image:end -->

### Image Contents

<!-- sf:versions:start -->
<details>
<summary>Base image</summary>

Built from `python:3.14.3-alpine3.23`.

| Name | Version |
| --- | --- |
| python | 3.14.3 |

</details>
<!-- sf:versions:end -->

### System Packages

<!-- sf:apk:start -->
![bash](https://img.shields.io/badge/bash-555?style=flat) ![coreutils](https://img.shields.io/badge/coreutils-555?style=flat) ![curl](https://img.shields.io/badge/curl-555?style=flat) ![git](https://img.shields.io/badge/git-555?style=flat) ![jq](https://img.shields.io/badge/jq-555?style=flat) ![openssh](https://img.shields.io/badge/openssh-555?style=flat) ![openssh-keygen](https://img.shields.io/badge/openssh--keygen-555?style=flat) ![rage](https://img.shields.io/badge/rage-555?style=flat) ![rsync](https://img.shields.io/badge/rsync-555?style=flat)
<!-- sf:apk:end -->

### Python Packages

<!-- sf:pip:start -->
![ansible-core](https://img.shields.io/badge/ansible--core-2.20.4-2ea043?style=flat) ![ansible-lint](https://img.shields.io/badge/ansible--lint-26.3.0-2ea043?style=flat) ![hvac](https://img.shields.io/badge/hvac-555?style=flat) ![kubernetes](https://img.shields.io/badge/kubernetes-555?style=flat) ![pip](https://img.shields.io/badge/pip-555?style=flat) ![pywinrm](https://img.shields.io/badge/pywinrm-555?style=flat) ![requests](https://img.shields.io/badge/requests-555?style=flat)
<!-- sf:pip:end -->

### Ansible Collections

<!-- sf:galaxy:start -->
![ansible.posix](https://img.shields.io/badge/ansible.posix-555?style=flat) ![ansible.windows](https://img.shields.io/badge/ansible.windows-555?style=flat) ![community.docker](https://img.shields.io/badge/community.docker-555?style=flat) ![community.hashi_vault](https://img.shields.io/badge/community.hashi__vault-555?style=flat) ![community.sops](https://img.shields.io/badge/community.sops-555?style=flat) ![kubernetes.core](https://img.shields.io/badge/kubernetes.core-555?style=flat)
<!-- sf:galaxy:end -->

### Binary Tools

<!-- sf:binaries:start -->
![sops](https://img.shields.io/badge/sops-v3.12.1-2ea043?style=flat) ![yq](https://img.shields.io/badge/yq-v4.52.4-2ea043?style=flat)
<!-- sf:binaries:end -->

### Documentation

| Topic | |
|-------|-|
| [Usage](docs/Usage.md) | Running the image locally and in CI/CD |
| [CI Component](docs/Component.md) | GitLab CI component inputs and setup |
| [Windows](docs/Windows.md) | WinRM configuration and inventory |

## Installation

```bash
docker run --rm -v $(pwd):/app -w /app docker.io/hlhd/ansible:latest ansible-playbook playbook.yaml
```

## License

Distributed under the [GPL-3.0](LICENSE) License.
