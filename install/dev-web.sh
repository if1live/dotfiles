#!/bin/bash

packages=(
  nginx
  memcached
  redis-server
)
for pkg in ${packages[@]}; do
  echo "install $pkg"
  sudo apt-get install -qq $pkg
done
