=====
Sensu
=====

Formulas to set up and configure sensu and sensu clients. Tested on CentOS 6.5.

Requires the epel repository. - [EPEL Formula](https://github.com/saltstack-formulas/epel-formula).
Requires a redis server - [Redis Formula](https://github.com/saltstack-formulas/redis-formula).

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``sensu``
------------

Installs the Sensu repository.

``sensu.master``
------------

Installs the sensu-server, sensu-api, uchiwa, and supporting packages, and
starts the associated services.

``sensu.client``
------------

Installs the template package, and starts the associated template service.