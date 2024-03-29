=============
Sensu-Formula
=============

Formulas to set up and configure sensu and sensu clients. Tested on CentOS 6.5.
This should work on other releases as well (Ubuntu / Debian) with some tweaking.

.. note::

- Requires the epel repository. - https://github.com/saltstack-formulas/epel-formula
- Requires a redis server - https://github.com/saltstack-formulas/redis-formula
- See the full Salt Formulas installation and usage instructions at http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html.

Generating Certificates
=====================

You will need to generate a few certificates and place the details into the
sensu pillar state in order to use this formula. To generate certificates, see
http://sensuapp.org/docs/latest/certificates.

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
