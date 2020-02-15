{% set binary = pillar['symfony']['binary'] %}
{% set user = pillar['home']['user'] %}

update_symfony:
  cmd.run:
    - name: {{ binary }} self:update --yes
    - runas: {{ user }}
