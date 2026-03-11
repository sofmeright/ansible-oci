# GitLab CI Component

Ansible OCI ships reusable GitLab CI component templates for structured playbook execution and testing.

> Requires GitLab 15.11+ and [Component CI/CD syntax](https://docs.gitlab.com/ee/ci/components/).

## Run Component

Executes an Ansible playbook with automatic SSH key injection, SOPS support, and full GitLab CI/CD context.

```yaml
deploy:
  stage: deploy
  component: $CI_SERVER_FQDN/precisionplanit/ansible-oci/run@~latest
  inputs:
    ansible_playbook: "ansible/playbooks/deploy.yaml"
    ssh_private_key: $SSH_PRIVATE_KEY
    gitlab_token: $GITLAB_TOKEN
```

### Run Inputs

| Name | Required | Default | Description |
|------|----------|---------|-------------|
| `ansible_playbook` | yes | | Path to the playbook file |
| `ansible_inventory` | no | `ansible/inventory` | Path to inventory file |
| `ansible_host_key_checking` | no | `false` | Disable SSH host key checking |
| `ssh_private_key` | no | | SSH private key for key-based auth |
| `windows_password` | no | | Password for non-domain Windows hosts |
| `sops_age_key_b64` | no | | Base64-encoded Age key for SOPS |
| `sops_age_key_path` | no | | Path to Age key file for SOPS |
| `working_dir` | no | | Base path for ansible execution |
| `job` | no | `run-ansible` | CI job name |
| `stage` | no | `ansible` | CI stage name |
| `artifacts` | no | `[]` | Paths to preserve as artifacts |
| `gitlab_branch` | no | `main` | Target branch for commits |
| `gitlab_token` | no | | Token for GitLab API calls |

### Automatic Setup

The run component automatically:
- Writes `ssh_private_key` to `~/.ssh/id_rsa` and adds it to the SSH agent
- Decodes `sops_age_key_b64` and exports `SOPS_AGE_KEY_FILE` if provided
- Injects GitLab CI/CD variables (`CI_COMMIT_TAG`, `CI_PROJECT_DIR`, etc.) as Ansible extra vars

## Test Component

Lints and validates Ansible playbooks.

```yaml
lint:
  stage: test
  component: $CI_SERVER_FQDN/precisionplanit/ansible-oci/test@~latest
  inputs:
    project_file: "playbooks/deploy.yaml"
```

### Test Inputs

| Name | Required | Default | Description |
|------|----------|---------|-------------|
| `project_file` | yes | | Ansible playbook to lint/validate |
| `root_dir` | no | `${CI_PROJECT_DIR}/ansible` | Root directory for Ansible config |
| `job` | no | `test-ansible` | CI job name |
| `stage` | no | (inherits) | CI stage name |
