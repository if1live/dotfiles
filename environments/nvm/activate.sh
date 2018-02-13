if [[ -s $HOME/.nvm/nvm.sh ]]; then
  source $HOME/.nvm/nvm.sh
  nvm_version=$(nvm --version)
  echo "nvm version : $nvm_version"
else
  echo "nvm not found"
fi
