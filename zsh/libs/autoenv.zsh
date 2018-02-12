function dotfiles::autoenv::init() {
  if [ -f "~/.autoenv/" ]; then
	  source ~/.autoenv/activate.sh
  fi
}
