local plugins = {
  { "nvim-lua/plenary.nvim" },

  { 
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd [[colorscheme catppuccin-mocha]]
    end
  },

  { "folke/which-key.nvim" },

  { 
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "",
      },
      show_trailing_blankline_indent = false,
      show_current_context = true,
      show_first_indent_level = false,
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    opts = {
      ensure_installed = { 
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "rust"
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,

	}
}

local options = {}

require("lazy").setup(plugins, options)
