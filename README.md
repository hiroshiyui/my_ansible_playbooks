# My Ansible Playbooks

## Requirements

* Python 2: Since Ansible currently has insufficient Python 3 support :-( You may want to use VirtualEnv or some similar Python version manager to setup a Python 2 installation.

## Installation

1. If your Python 2 installation is done by a version manager such as VirtualEnv, don't forget to activate it, for example:
    1. `make virtualenv`
    1. `source ~/virtualenv-ansible/bin/activate`
1. `make install`
1. `make ansible_install_roles`

## Nice play (maybe)

* `make ansible_setup_gce_openvpn ANSIBLE_USER=gcp_account_name`: Launch an OpenVPN server GCE instance.