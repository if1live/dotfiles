#!/bin/bash

function install_core {
	# locale
	sudo locale-gen ko_KR
	sudo locale-gen ko_KR.UTF-8

	# version control system
	sudo apt-get install -qq subversion mercurial

	# git
	sudo apt-get install -qq git git-flow

	# vim
	sudo apt-get install -qq vim-common

	# python
	sudo apt-get install -qq python2.7-dev python-virtualenv python-pip

	# fuck!
	sudo pip install thefuck

	sudo pip install Pygments

	# mosh
	sudo apt-get install -qq mosh

	sudo apt-get install -qq editorconfig
	sudo apt-get install -qq bison
}

function install_core_util {
	# core util
	sudo apt-get install -qq tree unzip zip htop ack-grep most colordiff

	# emacs additional package
	sudo apt-get install -qq cloc

	# https://github.com/ggreer/the_silver_searcher
	# A code-searching tool similar to ack, but faster.
	sudo apt-get install silversearcher-ag
}

function install_web_dev {
	sudo apt-get install -qq nginx memcached redis-server
}

function install_cpp_dev {
	sudo apt-get install -qq clang cmake make
}



function install_go {
	go get -u github.com/nsf/gocode
	go get -u golang.org/x/tools/cmd/goimports
	go get -u github.com/Perlmint/goautoenv
	go get -u github.com/tools/godep
}

case "$1" in
	"core")
		echo "# Install core"
		install_core
		;;
	"core_util")
		echo "# Install core util"
		install_core_util
		;;
	"core_emacs")
		echo "# Install core - emacs"
		install_core_emacs
		;;
	"go")
		echo "# Instal go development env"
		install_go
		;;
	"cpp_dev")
		echo "# Install c++ dev"
		install_cpp_dev
		;;
	"web_dev")
		echo "# Install web dev"
		install_web_dev
		;;
	*)
		echo "# unknown command"
		echo "core"
		echo "core_util"
		echo "core_emacs"
		echo "go"
		echo "cpp_dev"
		echo "web_dev"
		;;
esac
