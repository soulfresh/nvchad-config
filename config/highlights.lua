-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
}

M.add = {
  NvimTreeOpenedFolderName = { 
    -- fg = "green",
    bold = true
  },
  DiffAdd = {
    fg = "green",
    bg = "#f7ffd8",
  },
  -- a yellow might be more obvious than blue
  DiffChange = {
    fg = "yellow",
    bg = "#ffffc3",
  },
  DiffDelete = {
    bg = "#ffbcc5",
  },
  DiffText = {
    bg = "#ffffe6",
    bold = false,
  },
}

return M
