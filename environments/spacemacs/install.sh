if [ ! -d "$HOME/.emacs.d" ]; then
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
	echo ".emacs.d already exist"
fi
