-- Place your global vim settings in the settings.lua file
-- This ensures they override any settings vim settings set by NvChad
require "custom.settings"

-- Use this file to add new features/plugins
local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup

-- vim.g.copilot_assume_mapped = true

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Change the background color of the currently active buffer window.
-- TODO Use NvChad correctly
-- vim.cmd[[highlight ActiveWindow ctermbg=0 guibg=lightgrey]]
-- vim.cmd[[highlight ActiveWindow guibg=#17252c]]
-- vim.cmd[[highlight InactiveWindow guibg=#ff00ff]]

-- Call method on window enter
-- TODO Not working at the moment
-- local winman = autogrp("WindowManagement", {clear = true})
-- autocmd("WinEnter", {
--   cmd = function() SwapWindowBackground() end,
--   group = winman,
-- })

-- Change highlight group of preview window when open
-- function SwapWindowBackground()
--   vim.w.winhighlight= "Normal:ActiveWindow,NormalNC:InactiveWindow"
--   -- if &previewwindow
--   --   setlocal winhighlight=Normal:MarkdownError
--   -- endif
-- end
