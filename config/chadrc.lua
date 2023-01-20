-- Neovide config
-- Allow passing the command key
vim.g.neovide_input_use_logo = true
-- Pass the Alt key as the Meta key
vim.g.neovide_input_macos_alt_is_meta = false
-- Use an outline for the cursor when the window does not have focus
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_fullscreen = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.5

-- Vim settings
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.winwidth = 80
vim.opt.winminwidth = 10
vim.opt.winheight = 10
vim.opt.winminheight = 10
-- keep x lines visible above and below cursor at all times
vim.opt.scrolloff = 10
-- keep x columns visible left and right of the cursor at all times
vim.opt.sidescrolloff = 10

-- TODO Update docs to talk about downloading fonts
-- TODO Allow Tom to set his own fonts and theme
-- TODO Fix the fact that toggling the theme changes this file which shows up in
-- git.
-- My favorite fonts.
-- Download fronts via: https://github.com/ronniedroid/getnf
-- Preview fonts via: https://www.programmingfonts.org/
vim.opt.guifont = "FiraCode_Nerd_Font_Mono:h10"
-- vim.opt.guifont = "FuraMono_Nerd_Font:h10"
-- vim.opt.guifont = "Lilex_Nerd_Font:h10"
-- vim.opt.guifont = "MesloGL_Nerd_Font:h10"

-- Snippets path relative to $MYVIMRC. You can use ~/ prefixed paths.
-- See https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders
vim.g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"

-- Use this file for overrides of NvChad/lua/core/default_config.lua
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "onedark", "everforest_light" },
  theme = "everforest_light",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
