if [[ $OS_DIST_TYPE != "chromeos" ]]; then
  return
fi

# for chromebrew
export MYHOME=/usr/local/myhome
export GOPATH=$MYHOME:/go
export PATH=$PATH:$GOPATH/bin:/usr/local/share/nodebrew/current/bin/
