# dotfiles

My dotfiles

## Install
```bash
# install
git clone git@github.com:if1live/dotfiles.git
or
git clone https://github.com/if1live/dotfiles.git

# install basic environment
./bootstrap.sh
./bootstrap.sh oh-my-zsh
./bootstrap.sh rbenv
...(many bootstrap.sh option exist)

# set up virtualenv
virtualenv .venv
. .venv/base/bin/activate

# create dotfile symbolic link
pip install -r requirements.txt
python -m easylinker.cli meta-core.txt

# emacs package
cd ~/.emacs.d
Cask
```
