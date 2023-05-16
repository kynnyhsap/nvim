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
    build = ":TSUpdate",
    opts ={
      ensure_installed = { 
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "rust"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
    } ,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
	},

  {
    'numToStr/Comment.nvim',
    config = function(_, opts)
        require('Comment').setup()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },

  { 
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    opts = {},
    config = function(_, opts)
      require("telescope").setup(opts)
    end
  }, 


  {
    'akinsho/bufferline.nvim', 
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        offsets = {
          { filetype = "NvimTree", text = "" }
        }
      }
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end 
  },

  {
    "windwp/nvim-autopairs",
    config  = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end 
  },

  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk" }
    },
    config = function(_, opts)
      require("better_escape").setup(opts)
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end
  }
}

local options = {}

require("lazy").setup(plugins, options)
