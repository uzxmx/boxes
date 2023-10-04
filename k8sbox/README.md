# k8sbox

This box help setup kubernetes cluster quickly by pre-installing dependent components. It
uses [kubespray](https://github.com/kubernetes-sigs/kubespray) to deploy a cluster. The
installed kubernetes cluster version is 1.16.7 with below components:

* [calico v3.7.3](https://github.com/projectcalico/calicoctl)
* [helm v3.1.1](https://github.com/helm/helm)

## How to build

Make sure your system satisfies `requirements.txt`, if not, run `pip install -r requirements.txt`.

```
# One-liner way
make

# Or you can do with several steps
make provision
make do_package
make do_import
```

### Supported environment variables

When calling `make`, you can set below environment variables.

* PROXY

  The specified proxy should be an HTTP proxy, which is supported by kubespray.
  E.g. PROXY=10.0.2.2:8125
