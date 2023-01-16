local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- general
    -- "codespell",
    -- "misspell",
    -- "commitlint",
    -- TODO Only useful if it can fix issues for us
    -- "editorconfig-checker",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- "deno",
    "prettierd",
    -- "eslintd",
    -- "fixjson",
    -- "graphql-language-service-cli"
    -- "stylelint-lsp",
    -- "xo",
  },
}

M.nvimtree = {
  -- git support
  git = {
    enable = true,
  },

  view = {
    -- Resize the window on each draw based on the longest line.
    adaptive_size = false,
    -- If `false`, the height and width of windows other than nvim-tree will be equalized.
    preserve_window_proportions = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  -- project support
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },

}

return M
