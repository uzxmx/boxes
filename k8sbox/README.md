# k8sbox

This box help setup kubernetes cluster quickly by pre-installing dependent components.

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
