function dotfiles::shell::init {

}


# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/bin:$PATH"

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi
export VISUAL=$EDITOR

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# python encoding
export PYTHONIOENCODING="utf-8"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

export LC_ALL=ko_KR.UTF-8
export LANG=ko_KR.UTF-8

# the fuck
# https://github.com/nvbn/thefuck
# eval "$(thefuck --alias)"

# less + syntax highlight
# http://superuser.com/questions/117841/get-colors-in-less-command
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
