all: package import

package:
	vagrant up k8s-1 && vagrant ssh -c "cat /dev/null>~/.zsh_history" k8s-1 && vagrant halt k8s-1
	vagrant package --output k8s.box k8s-1

import:
	vagrant box add uzxmx/k8s k8s.box --force

clean:
	rm k8s.box

.PHONY: all package import clean
