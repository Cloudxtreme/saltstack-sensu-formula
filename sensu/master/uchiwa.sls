include:
  - sensu

{% from "sensu/map.jinja" import sensu_uchiwa with context %}

sensu_uchiwa:
  pkg:
    - installed
    - name: {{ sensu_uchiwa.pkg }}
  service:
    - running
    - name: {{ sensu_uchiwa.service }}
    - enable: True
  file.managed:
    - name: {{ sensu_uchiwa.conf }}
    - source: salt://sensu/master/files/uchiwa.json.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ sensu_uchiwa.service }}