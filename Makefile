.PHONY: help
help:
	@echo "My Ansible Playbooks" && \
	echo  "                    "

require-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

.check_ansible_user: require-ANSIBLE_USER

virtualenv:
	virtualenv --python=python2 ~/virtualenv-ansible

install:
	pip install -r requirements.txt

ansible_install_roles:
	ansible-galaxy install -r install-roles.yml

ansible_setup_gce_openvpn: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/openvpn-gce.yml

ansible_setup_gce_alway_free_resources: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-always-free-resources.yml