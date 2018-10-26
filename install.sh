#!/usr/bin/env bash

ln -s $(pwd)/nvim/ $HOME/.config/

if [ ! $(which curl) ]; then
  echo "You need to install curl before running neovim";
fi
