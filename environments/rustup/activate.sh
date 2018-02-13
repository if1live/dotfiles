if [[ -s $HOME/.cargo/env ]]; then
	source $HOME/.cargo/env

	cargo_version=$(cargo version 2>&1 > /dev/null | head -n 1 | sed 's/cargo //g')
	echo "cargo version : $cargo_version"
else
  echo "cargo not found"
fi
