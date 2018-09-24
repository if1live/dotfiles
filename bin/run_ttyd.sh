#!/bin/bash
TTYD_REPO_PATH=~/myhome/ttyd
TTYD_STATIC_ROOT=$TTYD_REPO_PATH/static/ ttyd --terminal-type=xterm zsh 2> /tmp/ttyd-log &
