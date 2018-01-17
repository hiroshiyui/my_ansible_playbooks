.PHONY: help
help:
	@echo "My Ansible Playbooks" && \
	echo  "                    "

install:
	pip install -r requirements.txt

ansible_install_roles:
	ansible-galaxy install -r install-roles.yml