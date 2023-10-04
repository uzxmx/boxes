# mybox

This box contains personal dotfiles.

## How to build

```
# One-liner way
make

# Or you can do with several steps
make provision
# TODO
make install_guest_additions
make do_package
make do_import
```

### Supported environment variables

When calling `make`, you can set below environment variables.

* SETUP_PROXY

  The specified proxy should be an HTTP proxy, which will be used when using
  git, and curl etc. E.g. SETUP_PROXY=10.0.2.2:8125

* SETUP_VERBOSE

  Output running commands in standard error stream by setting `SETUP_VERBOSE=1`.

* SETUP_PASS_COMMON_OPTS

  Whether the common options are allowed to pass into the real setup script.
  Currently supported options include `SETUP_PROXY` and `SETUP_VERBOSE`. Default
  is `1`.  Specify `0` to disable this.

* SETUP_EXTRA_OPTS

  The additional options passed into the real setup script. For more info,
  please visit the help of the real setup script. Or just specify
  `SETUP_OPTS=-h`.
