php_repository:
  pkgrepo.managed:
    - name: deb https://packages.sury.org/php stretch main
    - file: /etc/apt/sources.list.d/php.list
    - gpgcheck: 1
    - key_url: https://packages.sury.org/php/apt.gpg
    - require_in:
        - pkg: php_packages

nginx_repository:
  pkgrepo.managed:
    - name: deb https://nginx.org/packages/debian stretch nginx
    - file: /etc/apt/sources.list.d/nginx.list
    - gpgcheck: 1
    - key_url: https://nginx.org/keys/nginx_signing.key
    - require_in:
        - pkg: nginx

node_repository:
  pkgrepo.managed:
    - name: deb https://deb.nodesource.com/node_12.x stretch main
    - file: /etc/apt/sources.list.d/nodejs.list
    - gpgcheck: 1
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - require_in:
        - pkg: nodejs