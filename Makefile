.PHONY: help require-% virtualenv pip_install ansible_%
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
	virtualenv --python=python3.8 ~/virtualenv-ansible

pip_install:
	pip install -r requirements.txt

ansible_install_roles:
	ansible-galaxy role install -r install-roles.yml -f

ansible_setup_gce_openvpn: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-openvpn-instance.yml

ansible_setup_gce_always_free_resources: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ANSIBLE_DISPLAY_ARGS_TO_STDOUT=1 ansible-playbook -vvv -u $(ANSIBLE_USER) playbooks/gce-always-free-resources.yml

ansible_setup_gce_redmine: .check_ansible_user
	export $$(cat .env-gcp | xargs) && ansible-playbook -u $(ANSIBLE_USER) playbooks/gce-redmine-dev-instance.yml
