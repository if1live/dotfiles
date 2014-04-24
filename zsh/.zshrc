# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy/mm/dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github node npm pip python grunt)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/sora/.rbenv/plugins/ruby-build/bin:/home/sora/.rbenv/shims:/home/sora/.rbenv/bin:/home/sora/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
export VISUAL=$EDITOR

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"

# ruby
# http://gorails.com/setup/ubuntu/13.10
# git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# rbenv install 2.1.0
# rbenv global 2.1.0
# ruby -v

# added by travis gem
[ -f /home/sora/.travis/travis.sh ] && source /home/sora/.travis/travis.sh

if [[ `whoami` -eq "haruna" ]]; then
  echo "Env=> work"
  alias ssh-test="ssh if1live@ec2-54-248-222-118.ap-northeast-1.compute.amazonaws.com"
  alias ssh-others="ssh ubuntu@ec2-54-248-254-72.ap-northeast-1.compute.amazonaws.com"
else
  echo "Env=> home"
  alias ssh-pi="ssh pi@192.168.0.16"
fi


