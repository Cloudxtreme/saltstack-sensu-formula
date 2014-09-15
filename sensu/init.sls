{% if grains['os'] == 'Ubuntu' %}
sensu-repo:
  pkgrepo.managed:
    - humanname: Sensu Repository
    - name: deb http://repos.sensuapp.org/apt sensu main
    - file: /etc/apt/sources.list.d/sensu.list

{% elif grains['os'] == 'Debian' %}
sensu-repo:
  pkgrepo.managed:
    - humanname: Sensu Repository
    - name: deb http://repos.sensuapp.org/apt sensu main
    - file: /etc/apt/sources.list.d/sensu.list
{% elif grains['os'] == 'CentOS' %}
sensu-repo:
  pkgrepo.managed:
    - humanname: sensu-main
    - name: sensu-main
    - baseurl: http://repos.sensuapp.org/yum/el/$releasever/$basearch/
    - gpgcheck: 0
    - enabled: 1
{% endif %}