include:
  - sensu

{% from "sensu/map.jinja" import sensu_plugins with context %}

sensu_plugins:
  file.recurse:
    - name: {{ sensu_plugins.path }}
    - source: salt://sensu/master/files/plugins/
    - include_empty: True
    - makedirs: True
    - require:
      - pkg: sensu-client