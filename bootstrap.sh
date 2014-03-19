#!/bin/zsh


# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
#echo "The script you are running has basename `basename $0`, dirname `dirname $0`"
#echo "The present working directory is `pwd`

CURR_PWD=`dirname $0`

function remove_old() {
	TARGET_LIST=(
		.emacs
		.emacs.d
		.gitconfig
		.tmux.conf
		.vimrc
		.zshrc
		.config/awesome
	)
	for target in ${TARGET_LIST[@]}
	do
		if ! [ -e ~/$target ] ; then
			continue
		fi

		if [ -h ~/$target ] ; then
			rm ~/$target
		else
			echo "$target is not symbolic, you need to manual backup!"
		fi
	done
}

function run_symbolic_link() {
	DATA_LIST=(
		emacs/.emacs ~
		emacs/.emacs.d ~
		git/.gitconfig ~
		tmux/.tmux.conf ~
		vim/.vimrc ~
		zsh/.zshrc ~
		awesome ~/.config/
	)
	array_length=${#DATA_LIST[@]}
	for (( i=0 ; i < $array_length / 2 ; i++ ));
	do
		src=${DATA_LIST[$i*2+1]}
		dst=${DATA_LIST[$i*2+2]}
		ln -s $CURR_PWD/$src $dst
	done
}

remove_old
run_symbolic_link
