[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T41IT163)
# ![Ansible](https://gitlab.prplanit.com/uploads/-/system/project/avatar/21/Ansible_Logo.png?width=20) Ansible Docker (alpine base image)

A lightweight, production-ready Ansible image built on `python:3.13.5-alpine3.22` (plans to update as needed). This image was designed for running playbooks in CI/CD pipelines or local automation tasks.

Powered by Ansible 2.18.6, pre-loaded with common community collections and winrm support for managing Windows nodes.

---

## 🚀 Image Features

- ✅ Based on **Python 3.13** + **Alpine 3.22** for minimal footprint
- 🛠️ Includes:
  - `ansible-core==2.18.6`
  - `ansible-lint==25.6.1`
  - `pywinrm` for Windows management
  - `openssh-client`, `rsync` for secure file operations
- 📦 Pre-installed Ansible collections:
  - `ansible.posix`
  - `ansible.windows`
  - `community.docker`
- 🔐 Host key checking is disabled via `ANSIBLE_HOST_KEY_CHECKING=false` for smoother CI/CD use

---

## 🧪 Usage

### ✅ Run Locally

```bash
docker run --rm -v $(pwd):/app -w /app prplanit/ansible:2.18.6 ansible-playbook playbook.yaml
```

### 📦 Use in GitLab CI/CD

```yaml
ansible-deploy:
  stage: deploy
  image: your-registry/ansible:2.18.6
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

### 🧼 CMD Behavior

By default, the image runs:

```bash
ansible-playbook --version
```

Override this by providing your own entrypoint or script.

### 📌 Versions

- Ansible: 2.18.6
- ansible-lint: 25.6.1
- Python: 3.13.5
- Alpine: 3.22

🔗 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

🧪 License
Use it freely, deploy wisely, and remember: automation is power, but also responsibility.

🙅‍♂️ Disclaimer
> This image is provided as-is, without warranties, implied Ansible enlightenment, or protection from weekend-dev-ops rabbit holes. The author assumes no responsibility if your playbook summons demons or accidentally configures your microwave.

