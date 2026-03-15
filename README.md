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

[![latest](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/latest.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest) ![updated](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/release-updated.svg) [![size](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/release-size.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=v2.20.1) [![latest-dev](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/latest-dev.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest-dev) ![updated](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/dev-updated.svg) [![size](https://raw.githubusercontent.com/HomeLabHD/ansible/main/.stagefreight/badges/dev-size.svg)](https://hub.docker.com/r/hlhd/ansible/tags?name=latest-dev)
<!-- sf:image:end -->

### Base Image

<!-- sf:versions:start -->
| Name | Version | Source Ref |
| --- | --- | --- |
| alpine | 3.23 | FROM python:3.14.3-alpine3.23 |
| python | 3.14.3 | FROM python:3.14.3-alpine3.23 |
<!-- sf:versions:end -->

### System Packages

<!-- sf:apk:start -->
- bash
- coreutils
- curl
- git
- jq
- openssh
- openssh-keygen
- rage
- rsync
<!-- sf:apk:end -->

### Python Packages

<!-- sf:pip:start -->
| Name | Version | Pinned |
| --- | --- | --- |
| ansible-core | 2.20.3 | yes |
| ansible-lint | 26.3.0 | yes |
| hvac |  | no |
| kubernetes |  | no |
| pip |  | no |
| pywinrm |  | no |
| requests |  | no |
<!-- sf:pip:end -->

### Ansible Collections

<!-- sf:galaxy:start -->
- ansible.posix
- ansible.windows
- community.docker
- community.hashi_vault
- community.sops
- kubernetes.core
<!-- sf:galaxy:end -->

### Binary Tools

<!-- sf:binaries:start -->
| Name | Version | Pinned |
| --- | --- | --- |
| sops | v3.12.1 | yes |
| yq | v4.52.4 | yes |
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
