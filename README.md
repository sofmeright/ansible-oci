![Latest Release](https://gitlab.prplanit.com/precisionplanit/ansible-oci/-/badges/release.svg) ![Latest Release Status](https://gitlab.prplanit.com/precisionplanit/ansible-oci/-/raw/main/assets/badge-release-status.svg) [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T41IT163)
# ![Ansible](https://gitlab.prplanit.com/uploads/-/system/project/avatar/21/Ansible_Logo.png?width=20) Ansible OCI

A lightweight, production-ready Ansible Docker Image built on `python:3.13.5-alpine3.22` (plans to update as needed). This image was designed for running playbooks in CI/CD pipelines or local automation tasks.

Powered by Ansible 2.18.6, pre-loaded with common community collections and winrm support for managing Windows nodes.

---

## See Also:
- [Ansible (Gitlab Component)](https://gitlab.prplanit.com/components/ansible)
- [StageFreight GitLab Component](https://gitlab.prplanit.com/components/stagefreight) – GitLab CI pipeline orchestration for releases
- [StageFreight OCI (Docker Image)](https://gitlab.prplanit.com/precisionplanit/stagefreight-oci) – GitLab CI pipeline orchestration for releases

---

## 🚀 Image Features

- ✅ Based on **Python 3.13.5** + **Alpine 3.22** for minimal footprint
- 🛠️ Includes:
  - `ansible-core==2.18.6`
  - `ansible-lint==25.6.1`
  - `coreutils`
  - `curl`
  - `git`
  - `openssh`
  - `openssh-keygen`
  - `pywinrm` for Windows management
  - `rage`
  - `rsync`
  - `sops`
- 📦 Pre-installed Ansible collections:
  - `ansible.posix`
  - `ansible.windows`
  - `community.docker`
- 🔐 Host key checking is disabled via `ANSIBLE_HOST_KEY_CHECKING=false` for smoother CI/CD use

---

## ⛓️‍💥 Links:
- [Dockerhub](https://hub.docker.com/r/prplanit/ansible-oci): 
  - Public Image Releases.
- [GitLab](https://gitlab.prplanit.com/precisionplanit/ansible-oci):
  - Official Source, up to date; but 100% uptime can not be guaranteed.
- [Github](https://github.com/sofmeright/ansible-oci):
  - Source is available, (This can get out of sync with Gitlab).

---

## ⚙️ Usage

### ▶️ Run Locally
#### Basic Example:
```bash
docker run --rm -v $(pwd):/app -w /app prplanit/ansible-oci:latest ansible-playbook playbook.yaml
```
#### Advanced Example:
```
docker run -v ./playbook.yaml:/root/playbook.yaml -v /srv/gitops/ad-arbitorium-private:/srv/gitops/ad-arbitorium-private -v ~/.ssh/id_rsa:/root/.ssh/id_rsa --rm prplanit/ansible-oci:latest ansible-playbook --private-key /root/.ssh/id_rsa -i /srv/gitops/ad-arbitorium-private/ansible/inventory /root/playbook.yaml -e ansible_windows_password=$WINDOWS_ANSIBLE_PASSWORD
```

### 📦 Use in GitLab CI/CD

```yaml
ansible-deploy:
  stage: deploy
  image: prplanit/ansible-oci:latest
  script:
    - ansible-playbook ansible/deploy.yaml -i ansible/inventory
```

### 📁 File Structure

This image expects your playbooks and configuration files to live inside the /app directory by default.

Example layout:

```bash
/app
├── ansible.cfg
├── inventory
├── playbook.yaml
└── roles/
```

### 📝 Environment Variables

| Variable                    | Purpose                                       |
| --------------------------- | --------------------------------------------- |
| `ANSIBLE_HOST_KEY_CHECKING` | Disables host key checking (default: `false`) |

### ⚠️ Notes

- Keep in mind that pywinrm is included, but for full Windows management, you may need to pass additional credentials or certificates depending on your environment.
- This image does not contain systemd or sshd—it's designed strictly as a control node for executing playbooks, not as a managed host.

### 🐚 CMD Behavior

By default, the image runs:

```bash
ansible-playbook --version
```

Override this by providing your own entrypoint or script.

---

## 🫱🏽‍🫲🏽 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---

## 🪪 License
Use it freely, deploy wisely, and remember: automation is power, but also responsibility.

---

## ⚠️ Disclaimer
> This image is provided as-is, without warranties, implied Ansible enlightenment, or protection from weekend-dev-ops rabbit holes. The author assumes no responsibility if your playbook summons demons or accidentally configures your microwave.
