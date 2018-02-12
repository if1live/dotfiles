# node.js를 apt-get에서 가져다쓰면 필요없다
function dotfiles::nvm::init {
  if [[ -s $HOME/.nvm/nvm.sh ]]; then
    source $HOME/.nvm/nvm.sh
    nvm_version=$(nvm --version)
    echo "nvm version : $nvm_version"
  fi
}
