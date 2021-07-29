andrewrothstein.jq
==================
![Build Status](https://github.com/andrewrothstein/ansible-jq/actions/workflows/build.yml/badge.svg)

Installs [jq](https://stedolan.github.io/jq/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.jq
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
