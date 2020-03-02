all: import

provision:
	vagrant up --no-provision
	vagrant provision

define package
	vagrant ssh -c "cat /dev/null>~/.zsh_history" k8s-1 && vagrant halt
	vagrant package --output k8s.box k8s-1
endef

do_package:
	$(package)

package: provision
	$(package)

define import
	vagrant box add uzxmx/k8s k8s.box --force
endef

do_import:
	$(import)

import: package
	$(import)

clean:
	rm k8s.box

.PHONY: all provision do_package package do_import import clean
