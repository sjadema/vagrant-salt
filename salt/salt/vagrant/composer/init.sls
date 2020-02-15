{% set installer = pillar['common']['directories']['installers']['name'] + '/' + pillar['composer']['installer'] %}
{% set binary = pillar['common']['directories']['binaries']['name'] + '/' + pillar['composer']['binary'] %}

install_composer:
  file.managed:
    - name: {{ installer }}
    - source: salt://vagrant/composer/installer.sh
    - mode: 777
    - check_cmd: dos2unix
  cmd.run:
    - name: {{ installer }} {{ binary }}
    - unless: test -f {{ binary }}
    - runas: {{ pillar['common']['user'] }}

update_composer:
  cmd.wait:
    - name: composer self-update
    - runas: {{ pillar['common']['user'] }}
    - watch:
        - cmd: install_composer

configure_composer:
  cmd.wait:
    - name: composer -g config gitlab-token."{{ pillar['composer']['gitlab_domain'] }}" {{ pillar['composer']['access_token'] }}
    - runas: {{ pillar['common']['user'] }}
    - watch:
        - cmd: update_composer
