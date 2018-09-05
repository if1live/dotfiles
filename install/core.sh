#!/bin/bash

# 내가 설정한 zsh가 돌아가는데 필요한 최소패키지
# 한글 기본 설정 포함

# locale
sudo locale-gen ko_KR.UTF-8
# for linuxbrew
sudo locale-gen en_US.UTF-8

# git
sudo apt-get install -qq git

# use python3
sudo apt-get install -qq python3-pip

# for less filter
# install locally
pip3 install --user Pygments

# 16.04 python-software-properties
# 18.04 software-properties-common
sudo apt-get install software-properties-common software-properties-common
