#!/bin/bash

function install_core {
	# locale
	sudo locale-gen ko_KR
	sudo locale-gen ko_KR.UTF-8

	# version control system
	sudo apt-get install -qq git subversion mercurial

	# editor
	sudo apt-get install -qq emacs emacs-goodies-el vim-common

	# python
	sudo apt-get install -qq python2.7-dev python-virtualenv python-pip

	# core util
	sudo apt-get install -qq tree unzip
}

function install_linm {
	# linm
	# http://kldp.net/projects/mls/download
	sudo apt-get install -qq libsmbclient
	sudo apt-get install -qq libssl0.9.8
	sudo apt-get install -qq libssl1.0.0

	local linm_url="http://kldp.net/frs/download.php/4509/linm_0.8.1-1_amd64.deb"
	local tmp_linm_deb="/tmp/linm.deb"
	wget -O $tmp_linm_deb $linm_url
	sudo dpkg -i $tmp_linm_deb
}

function install_oh_my_zsh {
	if [ ! -d ~/.oh-my-zsh ]; then
		# https://github.com/robbyrussell/oh-my-zsh
		curl -L http://install.ohmyz.sh | sh
	else
		echo "oh-my-zsh already exist"
		return
	fi

	# https://github.com/yonchu/grunt-zsh-completion
	export OHMYZSH_CUSTOM_PLUGIN_PATH="$HOME/.oh-my-zsh/custom/plugins"
	git clone https://github.com/yonchu/grunt-zsh-completion.git "$OHMYZSH_CUSTOM_PLUGIN_PATH/grunt"
}

function install_nvm {
	git clone https://github.com/creationix/nvm.git ~/.nvm
	cd ~/.nvm
	git checkout `git describe --abbrev=0 --tags`
	. ~/.nvm/nvm.sh
	cd -
}

function install_rbenv {
	# https://gorails.com/setup/ubuntu/14.04
	sudo apt-get install -qq git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

	[ -z "$RBENV_ROOT" ] && export RBENV_ROOT="$HOME/.rbenv"

	if [ ! -d $RBENV_ROOT ]; then
		git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT
	else
		echo "rbenv already exist"
	fi

	local RUBY_BUILD_PATH="$RBENV_ROOT/plugins/ruby-build"
	if [ ! -d $RUBY_BUILD_PATH ]; then
		git clone git://github.com/sstephenson/ruby-build.git $RUBY_BUILD_PATH
	else
		echo "ruby-build already exist"
	fi

	# https://github.com/rkh/rbenv-update
	mkdir -p "$RBENV_ROOT/plugins"
	local RBENV_UPDATE_PATH="$RBENV_ROOT/plugins/rbenv-update"
	if [ ! -d $RUBY_BUILD_PATH ]; then
		git clone https://github.com/rkh/rbenv-update.git $RBENV_UPDATE_PATH
	else
		echo "rbenv-update already exist"
	fi
}

function install_emacs {
	if [ ! -d "$HOME/.cask" ]; then
		curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
	else
		echo "cask already exist"
	fi

	cd "$HOME/.emacs.d"
	cask
}

case "$1" in
	"core")
		echo "# Install core"
		install_core
		;;
	"linm")
		echo "# Install linm"
		install_linm
		;;
	"oh-my-zsh")
		echo "# Install oh-my-zsh"
		install_oh_my_zsh
		;;
	"rbenv")
		echo "# Install rbenv"
		install_rbenv
		;;
	"emacs")
		echo "# Install emacs"
		install_emacs
		;;
	"nvm")
		echo "# Install nvm"
		install_nvm
		;;
	*)
		echo "# unknown command"
		echo "select core, linm, oh-my-zsh, rbenv, emacs, nvm"
		;;
esac
