# My Ansible Playbooks

## Installation

1. `make virtualenv`
1. `source ~/virtualenv-ansible/bin/activate`
1. `make pip_install`
1. `make ansible_install_roles`

## Nice play (maybe)

* `make ansible_setup_gce_always_free_resources ANSIBLE_USER=gcp_account_name`: Launch an OpenVPN server in a GCE always-free instance.
