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

-- Override NvChad settings
vim.g.mapleader = ","
-- put cursor wrapping back to the vim defaults
vim.opt.whichwrap = "b,s"

-- Snippets path relative to $MYVIMRC. You can use ~/ prefixed paths.
-- See https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders
vim.g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"
