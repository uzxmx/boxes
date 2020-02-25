all: import

provision:
	vagrant up --no-provision
	vagrant provision --provision-with shell
	(vagrant vbguest --status | grep 'No Virtualbox Guest Additions installation found.$$' &>/dev/null && vagrant vbguest --do install) || true
	vagrant vbguest --status | grep -v 'No Virtualbox Guest Additions installation found.$$' &>/dev/null
	PROXY=$(PROXY) vagrant provision

define package
	vagrant ssh -c "sudo rm -rf /tmp/*; cat /dev/null>~/.zsh_history" && vagrant halt
	vagrant package --output my.box
endef

do_package:
	$(package)

package: provision
	$(package)

define import
	vagrant box add uzxmx/mybox my.box --force
endef

do_import:
	$(import)

import: package
	$(import)

clean:
	rm my.box

.PHONY: all provision do_package package do_import import clean
