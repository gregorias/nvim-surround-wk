#!/usr/bin/env bash
# Installs development dependencies (Which Key and nvim-surround) into deps/.
# Having them in deps lets LuaLS/typechecking provide accurate type information.

set -o errexit

mkdir -p deps

if [ ! -d deps/which-key.nvim ]; then
  git clone --depth 1 https://github.com/folke/which-key.nvim deps/which-key.nvim
fi

if [ ! -d deps/nvim-surround ]; then
  git clone --depth 1 -b feature/label https://github.com/gregorias/nvim-surround.git deps/nvim-surround
fi
