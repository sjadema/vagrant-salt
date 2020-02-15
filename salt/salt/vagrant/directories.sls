{% for directory in pillar['common']['directories'].values() %}
  {{ directory['name'] }}:
    file.directory:
      - user: {{ pillar['common']['user'] }}
      - group: {{ pillar['common']['group'] }}
      - dir_mode: {{ directory['mode'] }}
      - makedirs: True
      - recurse:
        - user
        - group
  {% endfor %}