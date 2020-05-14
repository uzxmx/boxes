# Project

## Quick start

This box uses [kubespray](https://github.com/kubernetes-sigs/kubespray) to deploy a cluster. The
installed kubernetes cluster version is 1.16.7 with below components:

* [calico v3.7.3](https://github.com/projectcalico/calicoctl)
* [helm v3.1.1](https://github.com/helm/helm)

### Setup kubernetes cluster

```
vagrant up --no-provision

# Install dependencies on the host machine.
# Use `sudo` if permission error happens.
pip install -r kubespray/requirements.txt

vagrant provision

# After the above is finished successfully, you can perform below command to connect.
# By default the instance name prefix is `k8s`.
vagrant ssh <instance-name-prefix>-1
```

### Reset kubernetes cluster

```
RESET_CLUSTER=1 vagrant provision
```

## License

[MIT License](LICENSE)
