#!/bin/bash

function install_core {
	# version control system
	sudo apt-get install git subversion mercurial

	# editor
	sudo apt-get install emacs emacs-goodies-el vim-common

	# python
	sudo apt-get install python python2.7-dev python-virtualenv python-pip

	# node
	sudo apt-get install nodejs
	sudo ln -s /usr/bin/nodejs /usr/bin/node
}

function install_oh_my_zsh {
	# https://github.com/robbyrussell/oh-my-zsh
	curl -L http://install.ohmyz.sh | sh

	# https://github.com/yonchu/grunt-zsh-completion
	export OHMYZSH_CUSTOM_PLUGIN_PATH="$HOME/.oh-my-zsh/custom/plugins"
	git clone https://github.com/yonchu/grunt-zsh-completion.git "$OHMYZSH_CUSTOM_PLUGIN_PATH/grunt"
}

function install_rbenv {
	# https://gorails.com/setup/ubuntu/14.04
	sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

	git clone git://github.com/sstephenson/rbenv.git .rbenv
	git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

	# https://github.com/rkh/rbenv-update
	[ -z "$RBENV_ROOT" ] && export RBENV_ROOT="$HOME/.rbenv"
	mkdir -p "$RBENV_ROOT/plugins"
	git clone https://github.com/rkh/rbenv-update.git "$RBENV_ROOT/plugins/rbenv-update"
}

case "$1" in
	"core")
		echo "Install core"
		install_core
		;;
	"oh-my-zsh")
		echo "Install oh-my-zsh"
		install_oh_my_zsh
		;;
	"rbenv")
		echo "Install rbenv"
		install_rbenv
		;;
	*)
		echo "unknown"
		;;
esac







