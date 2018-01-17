.PHONY: help
help:
	@echo "My Ansible Playbooks" && \
	echo  "                    "

.check_ansible_user:
ifndef ANSIBLE_USER
	$(error ANSIBLE_USER is undefined)
endif

virtualenv:
	virtualenv --python=python2 ~/virtualenv-ansible

install:
	pip install -r requirements.txt

ansible_install_roles:
	ansible-galaxy install -r install-roles.yml

ansible_setup_gce_openvpn: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/openvpn-gce.yml