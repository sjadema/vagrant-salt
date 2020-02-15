#!/usr/bin/env bash

if [ $# != 1 ]; then
  echo "Provide the absolute path to the Symfony binary."
  exit 1
fi

wget https://get.symfony.com/cli/installer -O - | bash
mv /home/vagrant/.symfony/bin/symfony "$1"
