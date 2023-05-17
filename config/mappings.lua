local M = {}

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
M.disabled = {
  n = {
    -- This seems to be a typo in the NvChad config but I'm not sure.
    -- I prefer ]d and [d
    ["d]"] = "",
    -- I'd prefer to use the `:NvChadUpdate` command so I don't accidentally
    -- trrigger an update.
    ["<leader>u"] = "",
  }
}

M.general = {
  i = {
    ["<C-i>"] = {
      function()
        GetHighlightGroupUnderCursor()
      end,
      "Show Highlight: show the highlight group name under the cursor."
    },
    ["<C-O>"] = {
      function()
        t('<Up>')
      end,
      "Move cursor up one line"
    },
    ["<C-o>"] = {
      function()
        t('<Down>')
      end,
      "Move cursor down one line"
    },
  },
  n = {
    ["<D-s>"] = {":wa<CR>", "Save All"},
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- This doesn't work because lua caches modules. There is a way to unload
    -- modules before loading them. This would also need to work with packer I
    -- think.
    -- ["<leader>sv"] = { ":source $MYVIMRC<CR>", "reload nvim config" },

    ["<leader>si"] = {
      function()
        GetHighlightGroupUnderCursor()
      end,
      "Show Highlight: show the highlight group name under the cursor."
    },

    -- Zoom
    -- TODO Just use + and -
    ["<C-=>"] = {
      function()
        ChangeScaleFactor(1.25)
      end,
      "Zoom + (Neovide)",
    },
    ["<C-->"] = {
      function()
        ChangeScaleFactor(1/1.25)
      end,
      "Zoom - (Neovide)",
      { silent = false }
    },

    -- Cursor movement
    -- NvChad maps gj/gk to j/k to work around navigating through wrapped lines
    -- but since I don't use line wrapping, I'm turning that off here.
    -- See core/mappings.lua for the original functionality.
    ["j"] = { "j", "Line down"},
    ["k"] = { "k", "Line up"},
    -- This conflicts with "merge with line below"
    -- ["J"] = { "gg", "Buffer bottom"},
    -- This conflicts with the standard hover keybinding
    -- ["K"] = { "G", "Buffer top"},
    -- Switch the jump to start/end of line and first/last blank character.
    -- ["0"] = { "^", "go to first non-blank character in line"},
    -- ["^"] = { "0", "go to first non-blank character in line"},
    -- ["$"] = { "g_", "go to the last non-blank character in line"},
    -- ["g_"] = { "$", "go to the last character in line (including whitespace)"},
    ["H"] = { "^", "go to first non-blank character in line"},
    ["L"] = { "g_", "go to the last non-blank character in line"},
    ["<D-h>"] = {"zH", "scroll window to left edge"},
    ["<D-l>"] = {"zL", "scroll window to right edge"},
    ["<D-k>"] = {"<C-y>", "scroll window to right edge"},
    ["<D-j>"] = {"<C-e>", "scroll window to left edge"},

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
    ["<D-]>"] = { ":tabnext<CR>", "Next tab" },
    ["<D-[>"] = { ":tabprevious<CR>", "Previous tab" },

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
  v = {
    ["H"] = { "^", "go to first non-blank character in line"},
    ["L"] = { "g_", "go to the last non-blank character in line"},
  }
}

M.lspconfig = {
  n = {
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto prev",
    },

    ["T"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Tooltip: Show LSP tooltip",
    },

    -- TODO Would be better if we could use "gD" or "gi" but only in C++ files.
    ["gh"] = {":ClangdSwitchSourceHeader<CR>", "Go To Header (C++)"},
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects"},
    ["<leader>gf"] = { "<cmd> Telescope git_bcommits <CR>", "Git file history"},
    ["<leader>gr"] = { "<cmd> Telescope git_branches <CR>", "Git branches"},
    ["<leader>ga"] = { "<cmd> Telescope git_stash <CR>", "Git stashes"},
  }
}

M.vimtree = {
  n = {
    -- TODO Remove C-n?
    ["<C-\\>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  }
}

M.gitsigns = {
  n = {
    ["<leader>cs"] = { "<cmd> Gitsigns stage_hunk <CR>", "Commits Stage: stage hunk at cursor" },
    ["<leader>ch"] = {
      function()
        local gs = require('gitsigns')
        gs.toggle_deleted(nil)
        gs.toggle_word_diff(nil)
        gs.toggle_linehl(nil)
        gs.toggle_numhl(nil)
      end,
      "Commits Highlight: color the git changes in a file."
    },
    ["<leader>cd"] = { "<cmd> Gitsigns diffthis <CR>", "Commits Diff: diff unstaged lines"},
    ["]c"] = {
      function()
        if vim.wo.diff then
          -- This works if vim fugitive is not installed. Not sure how to get
          -- them to work together.
          return "]c"
        end
        vim.schedule(function()
          local gs = require("gitsigns")
          gs.next_hunk({preview = true})
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          local gs = require("gitsigns")
          gs.prev_hunk({preview = true})
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
  }
}

-- M.neogit = {
--   n = {
--     ["<leader>gg"] = { "<cmd> Neogit <CR>", "Open Neogit Tab" },
--   }
-- }

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
  n = {
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>cl"] = {
      -- https://vi.stackexchange.com/questions/21260/how-to-clear-neovim-terminal-buffer
      -- nmap <c-w><c-l> :set scrollback=1 \| sleep 100m \| set scrollback=10000<cr>
      -- tmap <c-w><c-l> <c-\><c-n><c-w><c-l>i<c-l>
      function()
        if vim.bo.buftype == "terminal" then
          vim.api.nvim_feedkeys('z\r', 'n', false)
          -- TODO Try to get the current scrollback so we can reset to that
          -- local scrollback = vim.b.scrollback
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
  },

  t = {
    -- navigation in/out of terminal mode
    ["<Esc><Esc>"] = { "<C-\\><C-N>", "exit terminal mode"},
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "leave terminal left" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "leave terminal right" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "leave terminal down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "leave terminal up" },

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

-- Toggle the current Git status in a Diff Viewer tab.
vim.api.nvim_create_user_command("DiffviewToggleStatus", function(e)
  local view = require("diffview.lib").get_current_view()

  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen " .. e.args)
  end
end, { nargs = "*" })

-- Toggle the current branch history in a Diff Viewer tab.
vim.api.nvim_create_user_command("DiffviewToggleHistory", function(e)
  local view = require("diffview.lib").get_current_view()

  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewFileHistory " .. e.args)
  end
end, { nargs = "*" })

M.diffview = {
  n = {
    -- ['<leader>gs'] = { "<cmd> DiffviewToggleStatus <cr>", "Toggle the Git status view"},
    ['<leader>gh'] = { "<cmd> DiffviewToggleHistory <cr>", "Toggle the Git history view"},
  }
}

M.fugitive = {
  n = {
    ['<leader>gs'] = { "<cmd> G <cr>", "Toggle the Git status view"},
  }
}

M.undo = {
  n = {
    ["<leader>fu"] = { "<cmd> Telescope undo <cr>", "Find Undo: show undo history" },
  }
}

return M
