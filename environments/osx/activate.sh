if [[ $OS_TYPE != "osx" ]]; then
  return
fi

# mysql
# http://stackoverflow.com/questions/10557507/rails-mysql-on-osx-library-not-loaded-libmysqlclient-18-dylib
MYSQL=/usr/local/mysql/bin
if [ -d $MYSQL ]; then
	echo "mysql detected"
	export PATH=$PATH:$MYSQL
	export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
fi

# emacs
local emacs_path="/usr/local/opt/emacs/bin"
if [ -d $emacs_path ]; then
	echo "emacs detected"
	export PATH=/usr/local/opt/emacs/bin:$PATH
fi

# hangul locale
export LC_ALL="ko_KR.UTF-8"
export LANG="ko_KR.UTF-8"

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
	export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
