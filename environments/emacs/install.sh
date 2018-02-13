if [ ! -d "$HOME/.cask" ]; then
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
else
	echo "cask already exist"
fi

cd "$HOME/.emacs.d"
Cask
cd -
