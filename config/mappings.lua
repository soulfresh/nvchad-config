local M = {}

-- NEOVIDE
vim.g.neovide_scale_factor = 1.0
function ChangeScaleFactor(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

-- SYNTAX HIGHLIGHTING
function GetHighlightGroupUnderCursor()
  -- TODO Figure out how to do this in lua
  vim.cmd([[
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  ]])
end

-- add this table only when you want to disable default keys
-- M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-s>"] = ""
--   }
-- }

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>sv"] = { ":source $MYVIMRC<CR>", "reload nvim config" },

    ["<leader>hi"] = {
      function()
        GetHighlightGroupUnderCursor()
      end,
      "Print the highlight group name under the cursor."
    },

    -- Zoom
    -- TODO Only activate these in Neovide
    ["<C-=>"] = {
      function()
        print("Zoom +")
        ChangeScaleFactor(1.25)
      end,
      "Zoom + (Neovide)",
    },
    ["<C-->"] = {
      function()
        print('Zoom -')
        ChangeScaleFactor(1/1.25)
      end,
      "Zoom - (Neovide)",
      { silent = false }
    },

    -- NvChad maps gj/gk to j/k to work around navigating through wrapped lines
    -- but since I don't use line wrapping, I'm turning that off here.
    -- See core/mappings.lua for the original functionality.
    ["j"] = { "j", "down"},
    ["k"] = { "k", "up"},
    -- Switch the jump to start/end of line and first/last blank character.
    ["0"] = { "^", "go to first non-blank character in line"},
    ["^"] = { "0", "go to first non-blank character in line"},
    ["$"] = { "g_", "go to the last non-blank character in line"},
    ["g_"] = { "$", "go to the last non-blank character in line"},

    -- buffers
    ["Q"] = {
      ":q<CR>", "Close window"
      -- function()
      --   require("nvchad_ui.tabufline").close_buffer()
      -- end,
      -- "close buffer (duplicates <leader>x)",
    },

    -- splits
    ["ss"] = { ":split<CR><C-w>k", "horizontal split"},
    ["vv"] = { ":vsplit<CR><C-w>h", "vertical split"},

    -- tabs
    ["<leader>ts"] = { ":tab split", "open current buffer in new tab"},

    -- window sizing/movement
    ["<Left>"] = { ":vertical resize -1<CR>", "resize window left"},
    ["<S-Left>"] = { ":vertical resize 010<CR>", "resize window left"},
    ["<D-Left>"] = { ":winc H<CR>", "move window left"},
    ["<Right>"] = { ":vertical resize +1<CR>", "resize window right"},
    ["<S-Right>"] = { ":vertical resize +10<CR>", "resize window right"},
    ["<D-Right>"] = { ":winc L<CR>", "move window left"},
    ["<Up>"] = { ":resize -1<CR>", "resize window up"},
    ["<S-Up>"] = { ":resize -10<CR>", "resize window up"},
    ["<D-Up>"] = { ":winc K<CR>", "move window left"},
    ["<Down>"] = { ":resize +1<CR>", "resize window down"},
    ["<S-Down>"] = { ":resize +10<CR>", "resize window down"},
    ["<D-Down>"] = { ":winc J<CR>", "move window left"},

    -- highlighting
    ["//"] = { "<cmd> noh <CR>", "no highlight" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>t"] = { "<cmd> Telescope find_files <CR>", "Find files"},
    -- ["<leader>t"] = { "<leader>ff", "Find files", { expr = true }},
    ["<leader>b"] = { "<cmd> Telescope buffers", "Find buffers"},
    -- ["<leader>b"] = { "<leader>fb", "Find buffers", { expr = true }},
  }
}

M.vimtree = {
  n = {
    -- TODO Remove C-n?
    ["<C-\\>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  }
}

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.nvterm = {
  t = {
    -- navigation in/out of terminal mode
    ["<Esc>"] = { "<C-\\><C-N>", "exit terminal mode"},
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "leave terminal left" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "leave terminal down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "leave terminal up" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "leave terminal right" },

    -- always open vertical terminals on the left side of the screen
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
        -- The following doesn't seem to work
        vim.cmd(t('normal <Esc><C-w>h'))
      end,
      "toggle vertical term",
    },
  }
}

-- more keybinds!

return M
