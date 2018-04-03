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
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-openvpn-instance.yml

ansible_setup_gce_alway_free_resources: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-always-free-resources.yml

ansible_setup_gce_redmine: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-redmine-dev-instance.yml
