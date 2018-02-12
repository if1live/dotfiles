function dotfiles::pyenv::init {
  PYENV_ROOT="$HOME/.pyenv"

  if [[ -s $PYENV_ROOT/bin/pyenv ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init -)" || 1
    eval "$(pyenv virtualenv-init - 2> /dev/null)" || 1

    pyenv_version=$(pyenv 2>&1 > /dev/null | head -n 1 | sed 's/pyenv //g')
    echo "pyenv version : $pyenv_version"
  else
    echo "pyenv not found"
  fi
}
