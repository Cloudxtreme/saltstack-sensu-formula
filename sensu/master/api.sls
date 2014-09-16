include:
  - sensu

{% from "sensu/map.jinja" import sensu_api with context %}

sensu_api:
  pkg:
    - installed
    - name: {{ sensu_api.pkg }}
  service:
    - running
    - name: {{ sensu_api.service }}
    - enable: True
    - require:
      - pkg: {{ sensu_api.pkg }}
  grains.present:
    - name: sensu-api
    - value: true
  file.managed:
    - name: {{ sensu_api.conf }}
    - source: salt://sensu/master/files/api.json.jinja
    - template: jinja
    - user: sensu
    - group: sensu
    - mode: 644
    - watch_in:
      - service: {{ sensu_api.service }}