{% from "sensu/rabbitmq/map.jinja" import rabbitmq with context %}

rabbitmq:
{% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - humanname: RabbitMQ
    - name: deb     http://www.rabbitmq.com/debian/ testing main
    - file: /etc/apt/sources.list.d/rabbitmq.list
    - key_url: http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
{% endif %}
  pkg:
    - installed
    - name: {{ rabbitmq.pkg }}
{% if grains['os'] == 'CentOS' %}
    - sources:
      - rabbitmq-server: http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.1/rabbitmq-server-3.2.1-1.noarch.rpm
{% endif %}
  service:
    - running
    - name: {{ rabbitmq.service }}
    - enable: True
  file.managed:
    - name: {{ rabbitmq.conf }}
    - source: salt://sensu/rabbitmq/files/rabbitmq.config.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ rabbitmq.service }}

rabbitmq_ssldir:
  file.directory:
    - name: {{ rabbitmq.sslpath }}
    - user: sensu
    - group: sensu
    - mode: 777
    - makedirs: True
    - watch_in:
      - service: {{ rabbitmq.service }}

rabbitmq_sslcacert:
  file.managed:
    - name: {{ rabbitmq.sslpath }}cacert.pem
    - source: salt://sensu/rabbitmq/files/cacert.pem.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ rabbitmq.service }}

rabbitmq_sslcert:
  file.managed:
    - name: {{ rabbitmq.sslpath }}cert.pem
    - source: salt://sensu/rabbitmq/files/cert.pem.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ rabbitmq.service }}

rabbitmq_sslkey:
  file.managed:
    - name: {{ rabbitmq.sslpath }}key.pem
    - source: salt://sensu/rabbitmq/files/key.pem.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ rabbitmq.service }}