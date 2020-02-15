system:
  timezone: Europe/Amsterdam
  locales:
    - en_US.UTF-8
    - nl_NL.UTF-8
  default_locale:
    - en_US.UTF-8

home:
  user: vagrant
  group: vagrant
  directories:
    - bin
    - lib

installers:
  - composer
  - symfony

composer:
  binary: composer
  installer: salt://vagrant/composer/installer.sh
  gitlab_domain: some_gitlab_domain
  access_token: test

symfony:
  binary: symfony
  installer: salt://vagrant/symfony/installer.sh
