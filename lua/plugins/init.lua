local plugins = {
  { "nvim-lua/plenary.nvim" },

  { "folke/which-key.nvim" },

  { "nvim-tree/nvim-web-devicons" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- config = function()
    --   vim.cmd [[colorscheme catppuccin-mocha]]
    -- end
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'cool'
      }
      require('onedark').load()
    end
  },

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
    config = function()
      require('Comment').setup()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = { "NvimTree" }
      }
    },
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
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
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
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim', build = ":MasonUpdate" },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      lsp.ensure_installed({
        'tsserver'
      })
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      cmp.setup({
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<S-Space>'] = cmp.mapping.complete(),
        }
      })
    end
  }
}

local options = {}

require("lazy").setup(plugins, options)
