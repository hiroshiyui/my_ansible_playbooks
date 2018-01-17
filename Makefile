.PHONY: help
help:
	@echo "My Ansible Playbooks" && \
	echo  "                    "

virtualenv:
	virtualenv --python=python2 ~/virtualenv-ansible

install:
	pip install -r requirements.txt

ansible_install_roles:
	ansible-galaxy install -r install-roles.yml

ansible_setup_gce_openvpn:
	export $$(cat .env-gcp | xargs) && ansible-playbook playbooks/openvpn-gce.yml