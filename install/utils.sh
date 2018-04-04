#!/bin/bash

packages=(
  tree
  unzip
  zip
  htop
  most
  colordiff
  cloc

  # https://github.com/ggreer/the_silver_searcher
  # A code-searching tool similar to ack, but faster.
  silversearcher-ag

  # git
  git-flow

  mosh

  editorconfig
  bison
  
  # editor
  vim-nox
  emacs-nox

  tmux

  # rust 관련 패키지 설치할때 의존성 걸린거
  cmake
)

for pkg in ${packages[@]}; do
  echo "install $pkg"
  sudo apt-get install -qq $pkg
done

rust_utils=(
  exa
)
for x in ${rust_utils[@]}; do
  echo "install $x"
  cargo install $x
done
