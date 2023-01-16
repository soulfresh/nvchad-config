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

-- Clear a termina buffer:
-- ======================
-- I've tried various version listed here:
-- https://vi.stackexchange.com/questions/21260/how-to-clear-neovim-terminal-buffer
-- The best I've found so far will clear everything except for 1 page worth of
-- output.

-- function ClearTerm(reset)
--   vim.opt_local.scrollback = 1
--   vim.api.nvim_command("startinsert")
--   if reset == 1 then
--     vim.api.nvim_feedkeys("reset", 't', false)
--   else
--     vim.api.nvim_feedkeys("clear", 't', false)
--   end
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 't', true)
--   vim.opt_local.scrollback = 10000
-- end

-- Stack overflo
-- vim.api.nvim_set_keymap('t', '<C-l><C-l>', [[<C-\><C-N>:lua ClearTerm(0)<CR>]], mapping_opts)
-- vim.api.nvim_set_keymap('t', '<C-l><C-l><C-l>', [[<C-\><C-N>:lua ClearTerm(1)<CR>]], mapping_opts)

M.nvterm = {
  -- TODO Figure out how to do this only if the current buffer is a terminal
  n = {
    ["<leader>cl"] = {
      -- https://vi.stackexchange.com/questions/21260/how-to-clear-neovim-terminal-buffer
      -- nmap <c-w><c-l> :set scrollback=1 \| sleep 100m \| set scrollback=10000<cr>
      -- tmap <c-w><c-l> <c-\><c-n><c-w><c-l>i<c-l>
      function()
        if vim.bo.buftype == "terminal" then
          vim.api.nvim_feedkeys('z\r', 'n', false)
          vim.opt.scrollback = 1
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-l>', true, false, true), 't', true)
          -- vim.api.nvim_feedkeys('<C-l>', 't', true)
          vim.cmd('sleep 100m')
          -- vim.api.nvim_feedkeys("<C-l><C-\\><C-N>", 'i', false)
          -- vim.api.nvim_feedkeys(
          --   vim.api.nvim_replace_termcodes(
          --     "<C-l><C-\\><C-N>", true, false, true
          --   ),
          --   'i',
          --   false
          -- )
          vim.opt.scrollback = 10000
          -- vim.cmd('set scrollback=1')
          -- vim.cmd('sleep 100m')
          -- vim.cmd('set scrollback=10000')
        end
      end,
      -- "<cmd>:set scrollback=1 | sleep 100m | set scrollback=10000<cr>",
      -- ":set scrollback=1 \\| sleep 100m \\| set scrollback=10000<cr>",
      "Clear terminal output"
    }
  --   ["<C-o>"] = {
  --     function() ClearTerm() end,
  --     "Clear terminal output"
  --   },
  },

  t = {
    -- navigation in/out of terminal mode
    ["<Esc><Esc>"] = { "<C-\\><C-N>", "exit terminal mode"},
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "leave terminal left" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "leave terminal down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "leave terminal up" },

    -- other
    -- ["<C-o>"] = {
    --   function() ClearTerm() end,
    --   "Clear terminal output"
    -- },
    ["<M-l>"] = {
      function()
        vim.cmd('set scrollback=1')
        vim.cmd('sleep 100m')
        vim.cmd('set scrollback=10000')
      end,
      -- ":set scrollback=1 \\| sleep 100m \\| set scrollback=10000<cr>",
      "Clear terminal output"
    }
  }
}

-- more keybinds!

return M
