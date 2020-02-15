{% set user = pillar['home']['user'] %}
{% set group = pillar['home']['group'] %}
{% set home = '/home/' + user %}

{{ home }}/.bash_profile:
  file.managed:
    - source: salt://vagrant/home/.bash_profile
    - user: {{ user }}
    - group: {{ group }}
    - mode: 644
    - check_cmd: dos2unix

{{ home }}/.local:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 700
    - recurse:
        - user
        - group

{% for directory in pillar['home']['directories'] %}
{{ home }}/.local/{{ directory }}:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - recurse:
        - user
        - group
{% endfor %}
