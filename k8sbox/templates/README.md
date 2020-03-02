## Setup

```
vagrant up --no-provision

# Install dependencies on the host machine.
# Use `sudo` if permission error happens.
pip install -r ansible_playbooks/kubespray/requirements.txt

# If ansible version is 2.8.5 on the host, and you meet an error that "'delegate_to' is not a valid attribute for a TaskInclude", you can execute as below.
# Ref: https://github.com/kubernetes-sigs/kubespray/issues/3985
export ANSIBLE_INVALID_TASK_ATTRIBUTE_FAILED=False

vagrant provision
```
