function dotfiles::cocos2d-x::init {
  cocos_x_src_path=$HOME/devel/cocos2d-x-3.10
  cocos_x_root=$HOME/devel

  # Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
  export COCOS_CONSOLE_ROOT=$cocos_x_src_path/tools/cocos2d-console/bin
  export PATH=$COCOS_CONSOLE_ROOT:$PATH

  # Add environment variable COCOS_X_ROOT for cocos2d-x
  export COCOS_X_ROOT=$cocos_x_root
  export PATH=$COCOS_X_ROOT:$PATH

  # Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
  export COCOS_TEMPLATES_ROOT=$cocos_x_src_path/templates
  export PATH=$COCOS_TEMPLATES_ROOT:$PATH
}
