# dotfiles

My dotfiles

## Install
```bash
# install basic environment
./bootstrap.sh core
./bootstrap.sh oh-my-zsh
./bootstrap.sh rbenv

# set up virtualenv
mkdir -p ~/venv
cd ~/venv
virtualenv base
. ./base/bin/activate

# create dotfile symbolic link
pip install -r requirements.txt
python -m easylinker.cli meta-core.txt

# emacs package
cd ~/.emacs.d
Cask

# visual studio
python -m easylinker.cli meta-vs.txt
```


