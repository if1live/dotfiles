function dotfiles::local::init {
	local zshrc_local="$HOME/.zshrc.local"
	if [ ! -f $zshrc_local ]; then
		return
	fi

	echo "## Local"
	echo "Include Local zshrc"
	source $zshrc_local
	echo ""
}
