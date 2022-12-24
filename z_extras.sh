#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  npm install -g typescript-language-server typescript \
    @fsouza/prettierd eslint_d yarn
  brew install stylua
  brew install markdownlint-cli
  brew install ripgrep
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  npm install -g neovim typescript-language-server typescript \
    tree-sitter tree-sitter-cli @fsouza/prettierd eslint_d
fi
