{% set installers = '/etc/vagrant/installers' %}
{{ installers }}:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    - recurse:
        - user
        - group

{% for name in pillar['installers'] %}
{% set path = installers + '/' + name %}
{% set binary = pillar[name]['binary'] %}
{% set source = pillar[name]['installer'] %}

{{ path }}:
  file.managed:
    - source: {{ source }}
    - mode: 755
    - check_cmd: dos2unix
  cmd.run:
    - name: {{ path }} "$(systemd-path user-binaries)/{{ binary }}"
    - unless: test -f "$(systemd-path user-binaries)/{{ binary }}"
    - runas: {{ pillar['home']['user'] }}
{% endfor %}
