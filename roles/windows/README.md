# Ansible Role for Creating a Windows VM and Sending Mail to the Requester

This Ansible role is designed to create a new Windows virtual machine (VM) on a Proxmox server and send an email notification to the requester. The role assumes that you have already set up a Proxmox server and have configured email on the Windows server.

## Folder Structure

The role has the following folder structure:

```
├── defaults
│   └── main.yml
├── tasks
│   ├── add_user.yml
│   ├── main.yml
│   ├── proxmox.yml
│   ├── sending_mail.yml
│   └── variables.yml
├── templates
│   ├── mail_body.html.j2
│   └── send-mail.ps1.j2
└── vars
    └── main.yml

```

```defaults``` folder

This folder contains default variables for the role. These variables can be overridden in the ```vars``` folder or in the playbook.

```vars``` folder

This folder contains other variables for the role. You should edit the ```main.yml``` file in this folder to set the values for the Proxmox server and the email notification.

```yaml

proxmox_api_host: 10.0.0.10
proxmox_gateway: 10.0.0.1
proxmox_api_user: root
proxmox_api_password: secret
proxmox_base_endpoint: https://{{ proxmox_api_host }}:8006/api2
to_email=newemail@email.com
proxmox_storage: local-lvm
proxmox_node: node_name
gmail_app_password: pass_email
proxmox_core: 4
proxmox_memory: 4096
disk_size: 64

```
```tasks``` folder

- This folder contains the main tasks for the role. 
- The ```main.yml``` file redirects to the task files. 
- The ```proxmox.yml``` file creates a new VM on the Proxmox server. 
- The ```add_user.yml``` file creates a new user on the Windows server. 
- The ```sending_mail.yml``` file sends an email notification to the requester.

```templates``` folder

- This folder contains the templates used to set up the email notification. 
- The ```mail_body.html.j2``` file contains the HTML body of the email. 
- The ```send-mail.ps1.j2``` file is a PowerShell script that sends the email.

## Usage

To use this role, include it in your playbook and set the necessary variables in the ```vars``` folder. For example:yaml
```yaml
- name: Create a new Windows VM and send email notification
  hosts: proxmox
  become: true
  roles:
    - role: ansible-create-vm
      vars:
        proxmox_api_host: 10.0.0.10
        proxmox_gateway: 10.0.0.1
        proxmox_api_user: root
        proxmox_api_password: secret
        proxmox_base_endpoint: https://{{ proxmox_api_host }}:8006/api2
        to_email=newemail@email.com
        proxmox_storage: local-lvm
        proxmox_node: node_name
        gmail_app_password: pass_email
        proxmox_core: 4
        proxmox_memory: 4096
        disk_size: 64
```

