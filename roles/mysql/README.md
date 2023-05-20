# Ansible Role for installing MySQL Package with Multiple Versions on Ubuntu 20.04

This role describes the steps to install multiple versions of the MySQL package on Ubuntu 20.04. The installation process will be done through a role that consists of several tasks.

## Folder Structure

The folder structure of the role is as follows:
```css
├── defaults
│   └── main.yml
├── handlers
│   └── main.yml
├── tasks
│   ├── configure.yml
│   ├── databases.yml
│   ├── main.yml
│   ├── replication.yml
│   ├── secure-installation-5-6.yml
│   ├── secure-installation-5-7.yml
│   ├── secure-installation-8-0.yml
│   ├── setup-5.6.yml
│   ├── setup-5.7.yml
│   ├── setup-8.0.yml
│   ├── users.yml
│   └── variables.yml
├── templates
│   ├── my.cnf.j2
│   ├── root-my.cnf.j2
│   └── user-my.cnf.j2
└── vars
    └── Debian.yml
```

Here's an overview of what each folder contains:
- ```defaults``` folder: contains default variables for the role.
- ```vars``` folder: contains the other variables for the role.
- ```handlers``` folder: contains the handlers that will restart the MySQL service when the role is finished.
- ```templates``` folder: contains the jinja2 templates for the MySQL service configuration.
- ```tasks``` folder: contains the main task files, including:
  - ```main.yml```: the first file that will run.
  - ```setup-&lt;version&gt;.yml```: tasks for installing MySQL &lt;version&gt; using ```dpkg``` or ```apt```.
  - ```secure-installation-&lt;version&gt;.yml```: tasks for securing the MySQL installation.
  - ```databases.yml```: tasks for checking if the databases are already installed.
  - ```users.yml```: tasks for checking if the users are already created.
  - ```configure.yml```: tasks for configuring the MySQL service.
- ```vars``` folder: contains the variables that define the packages to be installed for each version of MySQL.

## Defined Task

The role will perform the following tasks:
1. Install MySQL 5.6, 5.7, or 8.0 based on the version specified.
2. Secure the MySQL installation by preventing root user to login remotely, removing anonymous user, and removing test database.
3. Create databases and users if they are not already installed.
4. Configure the MySQL service.

## Defined Variables

The following variables must be defined for the role:
- ```version_mysql_install```: the version of MySQL to be installed (5.6, 5.7, or 8.0).
- ```mysql_user_name```: the name of the user that will be created.
- ```mysql_user_password```: the password for the user that will be created.
- ```mysql_port```: the port number that MySQL will listen to (default: 3306).
- ```mysql_bind_address```: the IP address that MySQL will listen to (default: 0.0.0.0).Usage


To use the role, simply include it in your playbook:

```markdown
- hosts: all
  roles:
    - mysql
```

Make sure to define the required variables in your playbook or inventory file.

