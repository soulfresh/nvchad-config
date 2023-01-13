
-- Neovide config
vim.g.neovide_input_use_logo = true
vim.g.neovide_fullscreen = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.5

-- turn off word wrap
vim.opt.wrap = false
vim.opt.winwidth = 80
vim.opt.textwidth = 80
vim.opt.guifont = "FiraCode_Nerd_Font_Mono:h10"

-- Use this file for overrides of NvChad/lua/core/default_config.lua
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "onedark", "everforest_light" },
  theme = "onedark",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
