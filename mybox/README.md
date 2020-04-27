# mybox

This box contains personal dotfiles.

## How to build

```
# One-liner way
make

# Or you can do with several steps
make provision
make install_guest_additions
make do_package
make do_import
```

You can optionally pass an environment variable like `PROXY=192.168.101.101:8123`, this
will enable git http(s) proxy and curl proxy, so the build will be much faster.

## Run ansible tasks with tags

You can run specific tasks with tags as shown below:

```
TAGS="tag1,tag2" vagrant provision
```

Current supported tags include:

* proxy
* dotfiles
