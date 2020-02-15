{% set installer = pillar['common']['directories']['installers']['name'] + '/' + pillar['symfony']['installer'] %}
{% set binary = pillar['common']['directories']['binaries']['name'] + '/' + pillar['symfony']['binary'] %}

install_symfony:
  file.managed:
    - name: {{ installer }}
    - source: salt://vagrant/symfony/installer.sh
    - mode: 777
    - check_cmd: dos2unix
  cmd.run:
    - name: {{ installer }} {{ binary }}
    - unless: test -f {{ binary }}
    - runas: {{ pillar['common']['user'] }}

update_symfony:
  cmd.wait:
    - name: {{ binary }} self:update --yes
    - runas: {{ pillar['common']['user'] }}
    - watch:
        - cmd: install_symfony
