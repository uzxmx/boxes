all: package import

package:
	vagrant up && vagrant ssh -c "sudo rm -rf /tmp/*; cat /dev/null>~/.zsh_history" && vagrant halt
	vagrant package --output my.box

import:
	vagrant box add uzxmx/mybox my.box --force

clean:
	rm my.box

.PHONY: all package import clean
