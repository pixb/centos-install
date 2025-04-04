#!/bin/env bash
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_NC='\033[0m'

if command -v tmux >/dev/null 2>&1; then
  echo -e "${COLOR_GREEN}tmux is installed.${COLOR_NC}"
else
  echo -e "${COLOR_YELLOW}tmux is not intall!${COLOR_NC}"
  yum install tmux -y
fi

if [ ! -d "${HOME}/.tmux" ]; then
  bash "./config/tmux/config_tmux.sh"
fi
