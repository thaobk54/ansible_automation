## VM and Pre-Installed API: 
This API requires the following arguments 
- 'proxmox_memory' which is the memory (in MB) of the VM you want to start
- 'proxmox_core' which is the core of the VM you want to start 
- 'to_email' which is the email of the requester
- 'applications' which is an array of pre-installed applications you can choose from including 
mysql:5.6, mysql:5.7, mysql:5.8, postgresql:9.6, postgresql:10, postgresql:11, postgresql:12, postgresql:13.

## Confluence API: 
This API requires the following arguments 
- 'proxmox_memory' which is the memory (in MB) of the VM you want to start 
- 'proxmox_core' which is the core of the VM you want to start 
- 'to_email' which is the email of the requester.
- 'startup_arguments' Based on the system properties listed in https://confluence.atlassian.com/doc/recognized-system-properties-190430.html, you need to define them in an array.
    ```
    Ex: startup_arguments: ['-Datlassian.mail.senddisabled=true']
    ```
## Windows API: 
This API requires the following arguments 
- 'proxmox_memory' which is the memory (in MB) of the VM you want to start
- 'proxmox_core' which is the core of the VM you want to start
- 'to_email' which is the email of the requester
- 'windows_type' which is the type of Windows you want to use, either windows-10 or windows-server.
## Jira API: 
This API requires the following arguments 
- 'proxmox_memory' which is the memory (in MB) of the VM you want to start
- 'proxmox_core' which is the core of the VM you want to start 
- 'to_email' which is the email of the requester.
## Delete VM: 
This API requires only one argument 
- 'vm_id' which is the ID of the VM you want to delete.

