function dotfiles::alias::init() {

}

alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

# cls is dos command. but it is short than clear.
alias cls='clear'

alias emasc='emacs'
alias e='emacs'

# use color
alias less='less -R'

# apt-get install ack-grep
# linux : ack-grep
# osx : ack
unalias ack 2> /dev/null
ack_exist=$(which ack > /dev/null 2> /dev/null; echo $?)
ack_grep_exist=$(which ack-grep > /dev/null 2> /dev/null; echo $?)
if [[ $ack_grep_exist == "0" ]] && [[ $ack_exist != "0" ]]; then
	echo "[Shell]\t ack-grep found, ack not found => enable ack alias"
	alias ack='ack-grep'
fi

alias ipconfig='ifconfig'

# mcs/gmcs 둘다 돌아가도록
mcs_exist=$(which mcs > /dev/null 2> /dev/null; echo $?)
gmcs_exist=$(which gmcs > /dev/null 2> /dev/null; echo $?)
if [[ $mcs_exist == "0" ]] && [[ $gmcs_exist != "0" ]]; then
	alias gmcs="mcs"
fi
if [[ $gmcs_exist == "0" ]] && [[ $mcs_exist != "0" ]]; then
	alias mcs="gmcs"
fi

alias py2='python2'
alias py3='python3'
