function dotfiles::travis::init {
	[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
}
