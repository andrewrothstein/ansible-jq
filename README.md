andrewrothstein.jq
==================
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-jq.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-jq)

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
