#!/bin/bash

# https://www.rosehosting.com/blog/how-to-install-python-3-6-on-ubuntu-16-04/
# ubuntu 16.04 까지만 유효
# 18.04는 기본 파이썬 버전이 3.6
sudo apt-get install software-properties-common python-software-properties
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6


