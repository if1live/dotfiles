if [ -d ~/.asdf ]; then
  . ~/.asdf/asdf.sh
  . ~/.asdf/completions/asdf.bash

  version=$(asdf | grep "version:" | awk '{print $2}')
  echo "asdf\t: $version"
fi
