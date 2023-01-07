#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

NVIM_HOME="$(realpath ~)/.config/nvim"
ROOT=$(realpath ../)
CONFIG=$(realpath ./config)
NVCHAD="$ROOT/NvChad"
CUSTON="$NVCHAD/lua/custom"

# Remove the custom folder symlined into the NvChad folder
if [ -L "$CUSTOM" ]
then
  echo "🚫 removing nvchad-config link"
  rm $ROOT/NVChad/lua/custom
else
  echo "✅ ${GREEN}NvChad/lua/custom${NC} not linked"
fi

# Remove the ~/.config/nvim symlink to NvChad and restore any backups
if [ -L $NVIM_HOME ]
then
  echo "🚫 unlinking ${GREEN}~/.config/nvim"
  rm $NVIM_HOME

  if [ -d ${NVIM_HOME}.backup ]
  then
    echo "📦 Restoring backup"
    mv $NVIM_HOME.backup $NVIM_HOME
  fi
else
  echo "✅ ${GREEN}~/.config/nvim${NC} is not symlinked"
fi

