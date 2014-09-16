include:
  - sensu

{% from "sensu/map.jinja" import sensu_client with context %}

sensu_client:
  pkg:
    - installed
    - name: {{ sensu_client.pkg }}
  service:
    - running
    - name: {{ sensu_client.service }}
    - enable: True
  file.managed:
    - name: {{ sensu_client.conf }}
    - source: salt://sensu/client/files/client.json.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: {{ sensu_client.service }}

sensu_client_ssldir:
  file.directory:
    - name: {{ sensu_client.sslpath }}
    - user: sensu
    - group: sensu
    - mode: 777
    - makedirs: True
    - watch_in:
      - service: {{ sensu_client.service }}

sensu_client_sslcert:
  file.managed:
    - name: {{ sensu_client.sslpath }}cert.pem
    - source: salt://sensu/client/files/cert.pem.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ sensu_client.service }}

sensu_client_sslkey:
  file.managed:
    - name: {{ sensu_client.sslpath }}key.pem
    - source: salt://sensu/client/files/key.pem.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ sensu_client.service }}