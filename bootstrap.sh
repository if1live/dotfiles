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

	# core util
	sudo apt-get install -qq tree unzip zip htop ack-grep most colordiff
}

function install_core_emacs {
	# ubuntu 14.10 -> emacs 24.3
	# magit require emacs >= 24.4
	# so, use ppa to use latest emacs
	sudo add-apt-repository ppa:ubuntu-elisp/ppa
	sudo apt-get update
	sudo apt-get install emacs-snapshot
}

function install_web_dev {
	sudo apt-get install -qq nginx memcached redis-server

	# heroku
	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

	# docker
	# docker 중복설치하면 경고떠서 가장 마지막에 배치
	wget -qO- https://get.docker.com/ | sh
	sudo usermod -aG docker $USER
}

function install_cpp_dev {
	sudo apt-get install -qq clang cmake make
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
	sudo apt-get install -qq zsh
	echo "change shell to zsh"
	chsh -s /usr/bin/zsh

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

function install_pyenv {
	# http://stackoverflow.com/questions/12806122/missing-python-bz2-module
	# 추가 패키지를 설치하지 않으면 python 3.4.3 설치중 에러가 뜬다
	# WARNING: The Python bz2 extension was not compiled. Missing the bzip2 lib?
	sudo apt-get install -qq libbz2-dev
	#sudo yum install libbz2-devel // or bzip2-devel

	[ -z "$PYENV_ROOT" ] && export PYENV_ROOT="$HOME/.pyenv"

	if [ ! -d $PYENV_ROOT ]; then
		git clone https://github.com/yyuu/pyenv.git $PYENV_ROOT
	else
		echo "rbenv already exist"
	fi
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

function install_autoenv {
	git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
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
	"core_emacs")
		echo "# Install core - emacs"
		install_core_emacs
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
	"pyenv")
		echo "# Install pyenv"
		install_pyenv
		;;
	"emacs")
		echo "# Install emacs"
		install_emacs
		;;
	"nvm")
		echo "# Install nvm"
		install_nvm
		;;
	"autoenv")
		echo "# Install autoenv"
		install_autoenv
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
		echo "core_emacs"
		echo "linm"
		echo "oh-my-zsh"
		echo "rbenv"
		echo "pyenv"
		echo "emacs"
		echo "nvm"
		echo "autoenv"
		echo "cpp_dev"
		echo "web_dev"
		;;
esac
