#!/usr/bin/env bash

if [ $# != 1 ]; then
  echo "Provide the absolute path to the Composer binary."
  exit 1
fi

EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', '/tmp/composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
  echo >&2 'Error: Invalid installer checksum'
  rm /tmp/composer-setup.php
  exit 1
fi

php /tmp/composer-setup.php --install-dir="$(dirname "$1")" --filename="$(basename "$1")" --quiet
RESULT=$?
rm /tmp/composer-setup.php
exit $RESULT
