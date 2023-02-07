local overrides = require("custom.plugins.overrides")

return {
	-- To remove a default plugin:
	-- ["hrsh7th/cmp-path"] = false,

	-- CMP (autocomplete menu)
	["hrsh7th/nvim-cmp"] = {
    override_options = function()
      return require('custom.plugins.cmp')
    end,
  },

	-- Telescope
	["nvim-telescope/telescope.nvim"] = {
		-- TODO Do I need this?
		override_options = {
			extensions_list = { "themes", "terms", "projects" },
		},
	},

	-- Startup dashboard plugin
	["goolord/alpha-nvim"] = require("custom.plugins.alpha"),

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
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
			require("custom.plugins.null-ls")
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
	-- Quickly cd into previously visited locally installed git repositories
	["ahmedkhalf/project.nvim"] = {
		after = "telescope.nvim",
		config = function()
			return require("custom.plugins.project").setup()
		end,
	},

	-- diff view
	-- Show git tree diffs in a dedicated tab page.
	["sindrets/diffview.nvim"] = {
		requires = "nvim-lua/plenary.nvim",
    config = function()
      print('setup diffview')
      require("diffview").setup({
        file_panel = {
          listing_style = "list",             -- One of 'list' or 'tree'
          tree_options = {                    -- Only applies when listing_style is 'tree'
            flatten_dirs = true,              -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
          },
        },
      })
    end
	},

	-- neogit
	-- Emacs Magit style git command interface.
	["TimUntersberger/neogit"] = {
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup({
				mappings = {
					-- modify status buffer mappings
					status = {
						-- Close the neogit tab
						["Q"] = "Close",
					},
				},
			})
		end,
	},

	-- GitHub copilot
	-- ['github/copilot.vim'] = {}
	["zbirenbaum/copilot.lua"] = {
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- Disable copilot suggestions UI because we will use CMP instead.
				suggestion = {
					auto_trigger = true,
					-- enabled = false
          -- keymap = {
          --   accept = "<C-,>",
          -- }
				},
				panel = {
					auto_refresh = true,
					-- enabled = false,
				},
			})
		end,
	},

	-- Copilot in nvim-cmp window
  -- TODO: This doesn't work yet.
	-- ["zbirenbaum/copilot-cmp"] = {
 --    -- after = 'copilot.lua',
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
 --        method = "getCompletionsCycling",
 --      })
	-- 	end,
	-- },
}
