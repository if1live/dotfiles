function dotfiles::chromeos::init {
	if [[ $OS_TYPE != "chromeos" ]]; then
		return
	fi

	echo "## ChromeOS"
	# for chromebrew
	export MYHOME=/usr/local/myhome
	export GOPATH=/usr/local/myhome/go
	export PATH=$PATH:$GOPATH/bin:/usr/local/share/nodebrew/current/bin/
}
