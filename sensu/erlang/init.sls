{% from "sensu/erlang/map.jinja" import erlang with context %}

erlang:
  pkg:
    - installed
    - name: {{ erlang.pkg }}