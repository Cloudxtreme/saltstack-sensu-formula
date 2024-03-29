include:
  - sensu

{% from "sensu/map.jinja" import sensu_server with context %}

sensu_server:
  pkg:
    - installed
    - name: {{ sensu_server.pkg }}
  service:
    - running
    - name: {{ sensu_server.service }}
    - enable: True
    - require:
      - pkg: {{ sensu_server.pkg }}
  grains.present:
    - name: sensu-server
    - value: true