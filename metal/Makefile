.POSIX:

env ?= "prod"

default: pre-install cluster

pre-install: 
	ansible-playbook \
		--inventory inventories/pre-install-${env}.yml \
		pre-install.yml -k --ask-vault-pass

cluster:
	ansible-playbook \
		--inventory inventories/${env}.yml -b \
		cluster.yml

console:
	ansible-console \
		--inventory inventories/${env}.yml

vagrant:
	vagrant up
