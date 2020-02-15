{{ pillar['system']['timezone'] }}:
  timezone.system:
    - utc: True

{% for locale in pillar['system']['locales'] %}
{{ locale }}_locale:
    locale.present:
        - name: {{ locale }}
{% endfor %}

default_locale:
    locale.system:
        - name: {{ pillar['system']['default_locale'] }}
