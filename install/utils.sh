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
)

for pkg in ${packages[@]}; do
  echo "install $pkg"
  sudo apt-get install -qq $pkg
done

