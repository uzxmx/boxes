all: import

provision:
	vagrant up --no-provision
	vagrant provision --provision-with shell
	ansible-galaxy install -r ../ansible_playbooks/requirements.yml
	PROXY=$(PROXY) vagrant provision

install_guest_additions:
	(vagrant vbguest --status | grep 'No Virtualbox Guest Additions installation found.$$' && vagrant vbguest --do install) || true

define package
	vagrant ssh -c "sudo rm -rf /tmp/*; cat /dev/null>~/.zsh_history" && vagrant halt
	vagrant package --output my.box
endef

do_package:
	$(package)

package: provision
	$(MAKE) install_guest_additions
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

.PHONY: all provision install_guest_additions do_package package do_import import clean
