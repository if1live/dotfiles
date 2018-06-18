# https://gorails.com/setup/ubuntu/14.04
sudo apt-get install -qq git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev

[ -z "$RBENV_ROOT" ] && export RBENV_ROOT="$HOME/.rbenv"

if [ ! -d $RBENV_ROOT ]; then
	git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT
else
	echo "rbenv already exist"
fi

local RUBY_BUILD_PATH="$RBENV_ROOT/plugins/ruby-build"
if [ ! -d $RUBY_BUILD_PATH ]; then
	git clone git://github.com/sstephenson/ruby-build.git $RUBY_BUILD_PATH
else
	echo "ruby-build already exist"
fi

# https://github.com/rkh/rbenv-update
mkdir -p "$RBENV_ROOT/plugins"
local RBENV_UPDATE_PATH="$RBENV_ROOT/plugins/rbenv-update"
if [ ! -d $RUBY_BUILD_PATH ]; then
	git clone https://github.com/rkh/rbenv-update.git $RBENV_UPDATE_PATH
else
	echo "rbenv-update already exist"
fi
