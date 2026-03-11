# Usage

## Run Locally

```bash
docker run --rm -v $(pwd):/app -w /app docker.io/prplanit/ansible-oci:latest ansible-playbook playbook.yaml
```

### Advanced Example

```bash
docker run --rm \
  -v ./playbook.yaml:/root/playbook.yaml \
  -v /srv/gitops/project:/srv/gitops/project \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  docker.io/prplanit/ansible-oci:latest \
  ansible-playbook --private-key /root/.ssh/id_rsa \
    -i /srv/gitops/project/ansible/inventory \
    /root/playbook.yaml \
    -e ansible_windows_password=$WINDOWS_ANSIBLE_PASSWORD
```

## GitLab CI/CD

```yaml
ansible-deploy:
  stage: deploy
  image: docker.io/prplanit/ansible-oci:latest
  script:
    - ansible-playbook ansible/deploy.yaml -i ansible/inventory
```

## File Structure

The image expects playbooks and configuration inside `/app` by default.

```
/app
├── ansible.cfg
├── inventory
├── playbook.yaml
└── roles/
```

## Environment Variables

| Variable                    | Default | Description                                    |
| --------------------------- | ------- | ---------------------------------------------- |
| `ANSIBLE_HOST_KEY_CHECKING` | `false` | Disables host key checking for smoother CI use |

## Included Tools

| Tool | Version | Purpose |
|------|---------|---------|
| ansible-core | 2.20.3 | Playbook execution |
| ansible-lint | 26.3.0 | Playbook validation |
| yq | 4.52.4 | YAML processing |
| sops | 3.12.1 | Encrypted secret management |
| rage | (system) | Age encryption backend |
| pywinrm | (latest) | Windows WinRM management |
| kubernetes | (latest) | Kubernetes API client |

## Ansible Collections

Pre-installed collections:

- `ansible.posix`
- `ansible.windows`
- `community.docker`
- `community.sops`
- `kubernetes.core`

## SSH Key Handling

The [CI component](Component.md) handles this automatically. When running the image directly, mount your key and add it to the agent:

```bash
docker run --rm \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa:ro \
  docker.io/prplanit/ansible-oci:latest \
  ansible-playbook --private-key /root/.ssh/id_rsa -i inventory playbook.yaml
```

## Notes

- This image is a control node only — it does not contain systemd or sshd.
- `CMD` defaults to `ansible-playbook --version`. Override by providing your own command.
