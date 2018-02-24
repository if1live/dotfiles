[ -z "$ASDF_ROOT" ] && export ASDF_ROOT="$HOME/.asdf"

if [ ! -d $ASDF_ROOT ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_ROOT --branch v0.4.2
else
	echo "asdf already exist"
fi
