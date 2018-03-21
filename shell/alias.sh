function dotfiles::alias::init() {

}

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

# cls is dos command. but it is short than clear.
alias cls='clear'

# use color
alias less='less -R'

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

# https://dev.to/sobolevn/instant-100-command-line-productivity-boost
# https://github.com/sobolevn/dotfiles/
alias la="exa -abghl --git --color=automatic"

# `cat` with beautiful colors. requires: pip install -U Pygments
alias c='pygmentize -O style=borland -f console256 -g'

# Bell when the program is finished. It is useful for some
# time-consuming operations. Like:
# > npm install && alert
alias alert="tput bel"
