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
