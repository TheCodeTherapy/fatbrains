#!/bin/bash
rm -rf ~/.local/share/nvim
sudo rm -rf /usr/share/nvim/*
mkdir -p ~/.local/share/nvim
sudo apt -y remove --purge neovim
sudo apt -y install ./nvim-linux64.deb

# git clone --depth 1 https://github.com/wbthomason/packer.nvim \
#   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

