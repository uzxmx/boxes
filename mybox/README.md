# mybox

This box contains personal dotfiles.

## How to build

```
# One-liner way
make

# Or you can do with several steps
make provision
make do_package
make do_import
```

You can optionally pass an environment variable like `PROXY=192.168.101.101:8123`, this
will enable git http(s) proxy and curl proxy, so the build will be much faster.
