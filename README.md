# Ansible Automation Playbooks

This repository contains a set of Ansible playbooks and roles for automating various tasks related to virtual machine creation and application installation.
## Getting Started

To use this repository, you will need to have knowledge about Ansible and its various concepts like roles, handlers, and inventories. You can install Ansible from the [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

Additionally, you can use Ansible Semaphore for automation, which is a web-based tool for managing Ansible projects. You can find more information about Ansible Semaphore at their official website [ansible-semaphore](https://www.ansible-semaphore.com/).

## Introduction

This project addresses the problem of developers needing to set up their development environments and test various applications like databases, confluence, and Jira without having to depend on the admin to create or set up virtual machines.

To solve this problem, we have created a set of Ansible playbooks and roles that can be used to automate the creation of virtual machines with specific applications installed on them. We have also used Ansible Semaphore to provide a web interface to trigger these playbooks and create VMs.

## Requirements

To use these playbooks, you will need to have Python version 3.5 or later installed. Additionally, you can integrate with Ansible Semaphore to automatically run a template.

We have used block and rescue in our playbooks to handle errors and take appropriate actions.

To get started, clone this repository to your local machine using the following commands:bash
```bash
git clone https://github.com/opsdev91/ansible_automation
cd ansible_automation
```

If you are using Ansible vault with these examples, you can add the ```--ask-vault-pass``` flag after the command.

You can define variables in a separate var file and include it in your playbook using the ```vars_files``` parameter.

## Playbooks and Roles

- ```confluence_playbook.yml```: This playbook creates a new virtual machine with Confluence installed on it. It also creates a PostgreSQL 9.6 database and uses it to store Confluence data.

- ```delete_vm.yml```: This playbook deletes a virtual machine via the Proxmox API.

- ```proxmox_playbook.yml```: This playbook creates a virtual machine and installs various applications like MySQL (multiple versions including 5.6, 5.7, and 8.0) and PostgreSQL (versions 9.6, 10, 11, 12, and 13).

- ```jira_playbook.yml```: This playbook creates a new virtual machine with Jira installed on it.

- ```windows_server.yml```: This playbook creates a new virtual machine with either Windows Server 2022 or Windows 10 installed on it.

The ```roles``` folder contains roles for various applications like MySQL, PostgreSQL, Confluence, Windows, Nginx Proxy (using Nginx Proxy Manager server), and Java.

## Contributing
If you would like to contribute to this repository, please feel free to submit a pull request with your changes or suggestions. We welcome any feedback or ideas for improving this project!

## Get Help

If you have any questions or problems, you can refer to the included FAQ or open a new issue in the [GitHub issue tracker](https://github.com/opsdev91/ansible_automation/issues). If you don't have a GitHub account, you can also contact us through our website [agileops.vn](https://agileops.vn/).

