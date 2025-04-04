#!/bin/bash
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_NC='\033[0m'

if [ ! -d "${HOME}/dev" ]; then
	mkdir -p "${HOME}/dev"
fi

if [ ! -d "./res" ]; then
	mkdir -p "./res"
fi

VIM_VERSION=9.1.1275
VIM_PATH="vim-${VIM_VERSION}"

if command -v vim >/dev/null 2>&1; then
	echo "vim is installed"
else
	echo "vim is not install"
  if [ ! -e ./res/${VIM_PATH}.tar ]; then
    curl -L https://github.com/vim/vim/archive/refs/tags/v${VIM_VERSION}.tar.gz -o ./res/${VIM_PATH}.tar.gz
    tar -zxvf ./res/${VIM_PATH}.tar.gz -C ./res
  else
    tar -zxvf ./res/${VIM_PATH}.tar.gz -C ./res
  fi
  # build vim
  if [ -d ./res/${VIM_PATH} ]; then
    cd ./res/${VIM_PATH}
    ./configure --with-features=huge --enable-multibyte
    make && make install
  fi
fi

if [ -d "${HOME}/dev/vimrc" ]; then
  echo -e "${COLOR_GREEN}echo vimrc is exists${COLOR_NC}"
else
  echo -e "${COLOR_YELLOW}echo vimrc is not exists${COLOR_NC}"
  git clone https://github.com/pixb/vimrc.git "${HOME}/dev/vimrc"
fi

if [ -e "${HOME}/dev/vimrc/vimrc" ]; then
  ln -sf "${HOME}/dev/vimrc/vimrc" "${HOME}"/.vimrc
fi
