# Ansible Role for creating a new VM in Proxmox

This is a Ansible role to create a new Virtual Machine (VM) using Proxmox API. This role performs the following tasks:

Add new user for requester, allow 'wheel' group to have passwordless sudo, and add user to the wheel group.
Create a VM from Proxmox through API (Clone from template, get IP, update this IP to static IP with IP get before, add to Proxmox hosts).
Install applications. Depending on application variables, this task will route to the corresponding role.
Register to domain with Nginx Proxy Manager.
Send a mail to confirm the VM creation with application installation.

## Folder Structure

The folder structure of this role is as follows:

```css
├── defaults
│   └── main.yml
├── tasks
│   ├── add_user.yml
│   ├── install_applications.yaml
│   ├── main.yml
│   ├── post_actions.yml
│   └── sending_mail.yml
├── templates
│   └── mail_body.html.j2
└── vars
    └── main.yml
```

- The ```defaults``` folder contains default variables for the role.
- The ```vars``` folder contains the other variables for the role.
- The ```templates``` folder contains a Jinja2 template for the email to be sent to the requester.
- The ```tasks``` folder contains the tasks required to create a VM, install applications, and send an email to the requester.
    - ```add_user.yml```: Adds a new user for the requester, allows the 'wheel' group to have passwordless sudo, and adds the user to the wheel group.
    - ```main.yml```: The default run task, which creates a VM from Proxmox through API (clone from template, get IP, update this IP to a static IP with IP get before, add to Proxmox hosts).
    - ```install_applications.yml```: Installs an application. Depending on the application variables, this task will route to the corresponding role.
    - ```post_actions.yml```: Registers to a domain with Nginx Proxy Manager.
    - ```sending_mail.yml```: Sends an email to confirm the VM creation with application installation.
    
## Usage

To use this role, include it in your Ansible playbook and set any required variables. For example:

```yaml
proxmox_node: agileops-123
proxmox_api_user: root-user@pam
proxmox_api_host: 10.0.0.2
proxmox_gateway: 10.0.0.1
proxmox_api_password: root-user-password
clone_id: 9000
proxmox_base_endpoint: https://{{ proxmox_api_host }}:8006/api2
proxmox_storage: local-lvm
proxmox_core: 2
proxmox_memory: 4096
disk_size: 20
gmail_app_password: your_password_here
allow_public_access: false
local_port: 80
to_email: your_email@mail
applications: ['nginx']
```

If you want to clone a template, you will need to provide its unique identifier known as "clone_id". Please specify the clone_id of the template you wish to duplicate.


In this example, a new virtual machine will be created using the 9000 template. The virtual machine will be configured with 2 cores, 4096 MB of memory, and will be stored on the local-lvm storage. Once the virtual machine creation process is completed, an email will be sent to the email address provided as your_email@email. This email will contain information about the virtual machine that was created, including the username and password needed to log in. These credentials are defined in the Jinja2 template used to create the virtual machine.