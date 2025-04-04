#!/bin/env bash
chmod +x ./*
source ./proxy.sh
./yum_galaxy_repo.sh
./yum_install_package.sh
./vim_install.sh
./tmux_install.sh
