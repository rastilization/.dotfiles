#!/usr/bin/env bash

set -e

DIR=`pwd`


ask() {
  while true; do
    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi
    read -p "$1 [$prompt] " REPLY </dev/tty
    if [ -z "$REPLY" ]; then
      REPLY=$default
    fi
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac
  done
}


install_antibody() {
  echo "Installing antibody ..."

  mkdir -p ${HOME}/bin
  curl -sfL git.io/antibody | sh -s - -b ${HOME}/bin
}


bundle_zsh_plugins() {
  echo "Bundling zsh plugins ..."

  antibody bundle < ${DIR}/zsh/.shell/zsh_plugins.txt > ${DIR}/zsh/.shell/zsh_plugins.sh
}


stow_dotfiles() {
  echo "Linking dotfiles ..."

  for d in zsh scripts i3 polybar alacritty rofi dunst xresources;
  do
    stow -D $d
    stow $d
  done
}


install_zshrc_plugins() {
  [[ ! -f ${HOME}/bin/antibody ]] && install_antibody

  bundle_zsh_plugins
}


install_zshrc_plugins
stow_dotfiles
