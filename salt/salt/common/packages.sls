common_packages:
  pkg.installed:
    - pkgs:
        - htop
        - git
        - python-apt
        - vim
        - unzip
        - zip

php_packages:
  pkg.latest:
    - refresh: True
    - pkgs:
        - php7.4-curl
        - php7.4-fpm
        - php7.4-mbstring
        - php7.4-mysql
        - php7.4-intl
        - php7.4-zip
        - php-imagick
        - php-xdebug

nginx_packages:
  pkg.latest:
    - name: nginx
    - refresh: True
