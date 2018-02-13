# dotfiles

My dotfiles

## install

### clone repository

```bash
git clone git@github.com:if1live/dotfiles.git
or
git clone https://github.com/if1live/dotfiles.git
```

### create dotfile symbolic link

```bash
virtualenv .venv
. .venv/bin/activate

pip install -r requirements.txt
python -m easylinker.cli meta-core.txt
```


### install default packages

```bash
./install/core.sh
./install/utils.sh
...
./install/other-script.sh
```

### install environments

```bash
./environment/thefuck/install.sh
./environment/heroku/install.sh
...
./environment/other-env/install.sh
```
