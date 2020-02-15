{% set binary = pillar['composer']['binary'] %}
{% set user = pillar['home']['user'] %}

update_composer:
  cmd.run:
    - name: {{ binary }} self-update
    - runas: {{ user }}

configure_composer:
  cmd.wait:
    - name: {{ binary }} -g config gitlab-token."{{ pillar['composer']['gitlab_domain'] }}" {{ pillar['composer']['access_token'] }}
    - runas: {{ user }}
    - watch:
        - cmd: update_composer
