# Ansible Role: Install PostgreSQL with multiple version

This role is to install PostgreSQL with 5 versions: 9.6, 10, 11, 12, and 13.

## Folder Structure

The folder structure of this Ansible role is as follows:

```css
├── defaults
│   └── main.yml
├── handlers
│   └── main.yml
├── tasks
│   ├── main.yml
│   ├── postgresql-9.6.yml
│   ├── postgresql-another-version.yml
│   └── variables.yml
└── vars
    └── main.yml
```
- ```defaults``` folder: contains default variables for the role.
- ```vars``` folder: contains other variables for the role.
- ```handlers``` folder: contains the handlers that will restart the PostgreSQL service when the role is finished.
- ```tasks``` folder contains the main.yml file which is the entry point to the role and also includes the following task files
    - ```main.yml```: this file directs which PostgreSQL version to install based on the value of  ```postgresql_version``` variable.
    - ```postgresql-9.6.yml```: this file is used to install PostgreSQL 9.6 version.
    - ```postgresql-another-version.yml```: this file is used to install the other 4 versions of PostgreSQL.
    - ```variables.yml```: this file defines variables for the role.Variables

You must define the following variable in order to use this role:```postgresql_version```: the version of PostgreSQL you want to install (either 9.6, 10, 11, 12, or 13).

## Usage

To use this role, include it in your playbook and define the ```postgresql_version``` variable:yaml

```yaml
- name: Install PostgreSQL
  hosts: all
  roles:
    - role: install-postgresql
      vars:
        postgresql_version: "9.6"
```

Or if you want to install another version:yaml
```yaml
- name: Install PostgreSQL
  hosts: all
  roles:
    - role: install-postgresql
      vars:
        postgresql_version: "12"
```

