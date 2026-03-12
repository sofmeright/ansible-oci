# Windows Support

Ansible includes `pywinrm` for managing Windows hosts via WinRM.

## Inventory Configuration

```ini
[windows]
192.168.1.20 ansible_user=Administrator ansible_connection=winrm ansible_winrm_server_cert_validation=ignore
```

## CI Component Usage

Pass the Windows password via the `windows_password` input:

```yaml
deploy-windows:
  stage: deploy
  component: $CI_SERVER_FQDN/PrPlanIT/homelabhd/ansible/run@~latest
  inputs:
    ansible_playbook: "ansible/playbooks/windows-deploy.yaml"
    windows_password: $ANSIBLE_WINDOWS_PASSWORD
```

## Direct Image Usage

```bash
docker run --rm \
  -v $(pwd):/app -w /app \
  docker.io/hlhd/ansible:latest \
  ansible-playbook -i inventory playbook.yaml \
    -e ansible_windows_password=$WINDOWS_ANSIBLE_PASSWORD
```

## Notes

- For full Windows management you may need to pass additional credentials or certificates depending on your environment.
- WinRM is domain-independent — the `windows_password` input handles authentication for non-domain-joined hosts.
