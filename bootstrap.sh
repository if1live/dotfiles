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

function install_emacs {
	if [ ! -d "$HOME/.cask" ]; then
		curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
	else
		echo "cask already exist"
	fi

	cd "$HOME/.emacs.d"
	cask
}

function install_spacemacs {
	if [ ! -d "$HOME/.emacs.d" ]; then
		git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	else
		echo ".emacs.d already exist"
	fi
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
	"linm")
		echo "# Install linm"
		install_linm
		;;
	"oh-my-zsh")
		echo "# Install oh-my-zsh"
		install_oh_my_zsh
		;;
	"emacs")
		echo "# Install emacs"
		install_emacs
		;;
	"spacemacs")
		echo "# Install spacemacs"
		install_spacemacs
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
		echo "linm"
		echo "oh-my-zsh"
		echo "emacs"
		echo "spacemacs"
		echo "go"
		echo "cpp_dev"
		echo "web_dev"
		;;
esac
