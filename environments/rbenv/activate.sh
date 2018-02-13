RBENV_ROOT=$HOME/.rbenv

if [[ -s $RBENV_ROOT/bin/rbenv ]]; then
  export PATH=$RBENV_ROOT/bin:$PATH
  export PATH=$RBENV_ROOT/plugins/ruby-build/bin:$PATH

  eval "$(rbenv init -)"

  rbenv_version=$(rbenv 2>&1 > /dev/null | head -n 1 | sed 's/rbenv //g')
  echo "rbenv version : $rbenv_version"
else
  echo "rbenv not found"
fi
