common:
  user: vagrant
  group: vagrant
  directories:
    binaries:
      name: /home/vagrant/bin
      mode: 700
    installers:
      name: /etc/vagrant/installer
      mode: 755

composer:
  installer: composer.sh
  binary: composer
  gitlab_domain: gitlab.services.kirra.nl
  access_token: test

symfony:
  installer: symfony.sh
  binary: symfony