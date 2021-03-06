# Use colors, but only if connected to a terminal, and that terminal
# supports them.

DOTFILES=$HOME/.dotfiles

if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

printf "${BLUE}%s${NORMAL}\n" "Updating dotfiles"
cd "$DOTFILES"
if git pull --rebase --stat origin master
then
  printf '%s' "$GREEN"
  # http://patorjk.com/software/taag/#p=display&f=Slant&t=dotfiles
  printf '%s\n' '       __      __  _____ __          '
  printf '%s\n' '  ____/ /___  / /_/ __(_) /__  _____ '
  printf '%s\n' ' / __  / __ \/ __/ /_/ / / _ \/ ___/ '
  printf '%s\n' '/ /_/ / /_/ / /_/ __/ / /  __(__  )  '
  printf '%s\n' '\__,_/\____/\__/_/ /_/_/\___/____/   '
  printf "${BLUE}%s\n" "Hooray! dotfiles has been updated and/or is at the current version."
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
