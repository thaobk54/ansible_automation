# Ansible Role for Confluence Installation and Configuration

This Ansible role is designed to install and configure Atlassian Confluence on a Debian-based system. The role assumes that you have already set up a PostgreSQL database and user for Confluence.

## Folder Structure

The role has the following folder structure:

```css
├── defaults
│   └── main.yml
├── handlers
│   └── main.yml
├── tasks
│   ├── config.yml
│   ├── main.yml
│   └── postgres.yml
├── templates
│   ├── conf
│   │   ├── confluence-init.properties.j2
│   │   ├── confluence.cfg.xml.j2
│   │   ├── server.xml-default.j2
│   │   └── server.xml.j2
│   ├── response.varfile.j2
│   └── systemd
│       └── confluence.service.j2
└── vars
    └── main.yml
```
```defaults``` folder

This folder contains default variables for the role. These variables can be overridden in the ```vars``` folder or in the playbook.

```vars``` folder

This folder contains the other variables for the role. You should edit the ```main.yml``` file in this folder to set the values for the PostgreSQL database.yaml

```yaml
confluence_database_engine: postgresql
confluence_database_engine_version: 9.6
confluence_database_username: confluence
confluence_database_password: 123456
confluence_database_name: confluence
confluence_database_host: localhost
confluence_database_port: 5432
```

```handlers``` folder

This folder contains the handlers that will restart the PostgreSQL service when the role is finished.

```tasks``` folder

- This folder contains the main tasks for the role. 
- The ```main.yml``` file is used to install Confluence from the deb package. 
- The ```postgres.yml``` file is used to create a PostgreSQL user and database for Confluence. 
- The ```config.yml``` file is used to configure Confluence.

```templates``` folder

- This folder contains the templates used to set up the configuration for Confluence. 
- The ```conf``` folder contains the configuration files for Confluence, including the ```confluence.cfg.xml.j2``` file that sets the database parameters. 
- The ```systemd``` folder contains the systemd service configuration file for Confluence.

## Usage

To use this role, include it in your playbook and set the necessary variables in the ```vars``` folder. For example:

```yaml
- name: Install and configure Confluence
  hosts: confluence
  become: true
  roles:
    - role: ansible-confluence
      vars:
        confluence_database_engine: postgresql
        confluence_database_engine_version: 9.6
        confluence_database_username: confluence
        confluence_database_password: 123456
        confluence_database_name: confluence
        confluence_database_host: localhost
        confluence_database_port: 5432
```

