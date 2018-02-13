#!/bin/bash

packages=(
  clang
  cmake
  make
)
for pkg in ${packages[@]}; do
  echo "install $pkg"
  sudo apt-get install -qq $pkg
done
