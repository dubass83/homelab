.POSIX:

default: cluster

pre-install: 
	ansible-playbook \
		--inventory inventories/homelab/pre-hosts.ini \
		pre-install.yml -k -b --ask-vault-pass

cluster:
	ansible-playbook \
		--inventory inventories/homelab/hosts.ini -b -K -v \
		cluster.yml

clean:
	ansible-playbook \
		--inventory inventories/homelab/hosts.ini \
		reset.yml

console:
	ansible-console \
		--inventory inventories/homelab/hosts.ini

vagrant:
	vagrant up
