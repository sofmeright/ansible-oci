# Ansible OCI

A lightweight, production-ready Ansible Docker image built on `python:3.14.3-alpine3.23`. Designed for running playbooks in CI/CD pipelines or local automation tasks. Powered by Ansible 2.20.3, pre-loaded with common community collections and WinRM support for managing Windows nodes.

<!-- sf:project:start -->
<!-- sf:project:end -->
<!-- sf:badges:start -->
<!-- sf:badges:end -->
<!-- sf:image:start -->
<!-- sf:image:end -->

### Features

|                                    |                                                                                     |
| ---------------------------------- | ----------------------------------------------------------------------------------- |
| **Alpine-based**                   | Python 3.14.3 + Alpine 3.23 for minimal footprint                                   |
| **Ansible Core 2.20.3**           | With ansible-lint 26.3.0 for playbook validation                                     |
| **Windows Support**               | pywinrm included for managing Windows hosts via WinRM                                |
| **SOPS Integration**              | rage + sops 3.12.1 for encrypted secret management                                   |
| **Community Collections**         | ansible.posix, ansible.windows, community.docker, community.sops, kubernetes.core     |
| **CI/CD Ready**                   | GitLab CI component templates included for structured playbook execution              |
| **System Tools**                  | bash, coreutils, curl, git, jq, openssh, rsync, yq 4.52.4                           |

### Documentation

| Topic | |
|-------|-|
| [Usage](docs/Usage.md) | Running the image locally and in CI/CD |
| [CI Component](docs/Component.md) | GitLab CI component inputs and setup |
| [Windows](docs/Windows.md) | WinRM configuration and inventory |

## Installation

```bash
docker run --rm -v $(pwd):/app -w /app docker.io/prplanit/ansible-oci:latest ansible-playbook playbook.yaml
```

## License

Distributed under the [GPL-3.0](LICENSE) License.
