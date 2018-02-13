# http://stackoverflow.com/questions/12806122/missing-python-bz2-module
# 추가 패키지를 설치하지 않으면 python 3.4.3 설치중 에러가 뜬다
# WARNING: The Python bz2 extension was not compiled. Missing the bzip2 lib?
sudo apt-get install -qq libbz2-dev
#sudo yum install libbz2-devel // or bzip2-devel

[ -z "$PYENV_ROOT" ] && export PYENV_ROOT="$HOME/.pyenv"

if [ ! -d $PYENV_ROOT ]; then
	git clone https://github.com/yyuu/pyenv.git $PYENV_ROOT
else
	echo "rbenv already exist"
fi

# pyenv + virtualenv 충돌 해결용
# https://github.com/yyuu/pyenv-virtualenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
