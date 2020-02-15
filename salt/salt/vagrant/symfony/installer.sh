#!/usr/bin/env bash

if [ $# != 1 ]; then
  echo "Provide the absolute path to the Symfony binary."
  exit 1
fi

wget https://get.symfony.com/cli/installer -q -O - | bash > /dev/null
ln -s /home/vagrant/.symfony/bin/symfony "$1"
