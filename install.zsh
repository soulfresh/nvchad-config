#!/bin/sh

# Pre-reqs
brew install coreutils # realpath
brew install ripgrep # grep searching with Telescope.

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

NVIM_HOME="$(realpath ~)/.config/nvim"
ROOT=$(realpath ../)
CONFIG=$(realpath ./config)

# Copy chadrc.lua.template to chadrc.lua (if it doesn't already exist)
if [ ! -e "config/chadrc.lua" ]
then
  cp ./config/chadrc.lua.template ./config/chadrc.lua
fi

# Clone NvChad along side this folder
if [ ! -d "../NvChad" ]
then
  echo "🚗 cloning NvChad"
  git clone https://github.com/NvChad/NvChad $ROOT/NvChad --depth 1
else
  echo "✅ NvChad already checked out"
fi

# Symlink nvchad-config into NvChad/lua/custom
if [ ! -d "../NvChad/lua/custom" ]
then
  echo "🔗 Linking nvchad-config"
  ln -s $CONFIG $ROOT/NVChad/lua/custom
else
  if [ -L "../NvChad/lua/custom" ]
  then
    echo "✅ ${GREEN}NvChad/lua/custom${NC} already linked"
  else
    echo "🙈 ${RED}../NvChad/lua/custom${NC} already exists and is not a symlink. You will need to backup your custom config before proceeding."
    exit 1
  fi
fi

# Symlink NvChad into ~/.config/nvim
if [ -e "$NVIM_HOME" ]
then
  if [ -L "$NVIM_HOME" ]
  then
    if [ -d "$NVIM_HOME" ]
    then
      echo "✅ ${GREEN}$NVIM_HOME${NC} is already linked to ${GREEN}$(cd -P "$NVIM_HOME" && pwd)"
    else
      echo "✅ ${GREEN}$NVIM_HOME${NC} is already linked to ${GREEN}$(realpath "$NVIM_HOME")"
    fi
  else
    echo "📦 Backing up existing nvim config to ${GREEN}.config/nvim.backup"
    mv $NVIM_HOME $NVIM_HOME.backup
    echo "🔗 Linking NvChad into ${GREEN}~/.config/nvim"
    ln -s $ROOT/NvChad ~/.config/nvim
  fi
else
  echo "🔗 Linking NvChad into ${GREEN}~/.config/nvim"
  ln -s $ROOT/NvChad ~/.config/nvim
fi

