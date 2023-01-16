local overrides = require "custom.plugins.overrides"

return {
  -- To remove a default plugin:
  -- ["hrsh7th/cmp-path"] = false,

  -- Telescope
  ["nvim-telescope/telescope.nvim"] = {
    override_options = {
      extensions_list = { "themes", "terms", "projects" },
    }
  },

  -- Startup dashboard plugin
  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- show keybindings for commands as you type
  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["NvChad/nvterm"] = {
    behavior = {
      autoclose_on_quit = {
        enabled = true,
        confirm = true,
      },
      auto_insert = false,
    },
    autoclose_on_quit = {
      enabled = true,
      confirm = true,
    },
    auto_insert = false,
  },

  -- projects
  ["ahmedkhalf/project.nvim"] = {
    after = 'telescope.nvim',
    config = function()
      -- require('telescope').load_extension 'projects'
      require("custom.plugins.project").setup()
    end,
  },
}

