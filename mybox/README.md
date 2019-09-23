# mybox

This box contains personal dotfiles.

## Usage

* When VM is not created, execute `vagrant up`.

* Use `vagrant ssh` to configure VM.

* Or use `vagrant provision` to configure VM.

Passing parameter like `PROXY=192.168.101.101:8123` to `vagrant provision` will enable git http(s) proxy and curl proxy, so the installation will be much faster.

* Run `make`, and finally a new box will be generated and added into vagrant.
