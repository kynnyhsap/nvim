-- 
-- options
--
require "core.options"

-- 
-- keymaps
--
require "core.keymaps"

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--
-- plugins
--
require("lazy").setup({
  -- color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 'zig', 'python' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },


  "numToStr/Comment.nvim",
  
  "lewis6991/gitsigns.nvim",

  "tpope/vim-sleuth",

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   tag = "0.1.1",
  --   config = function()
  --     require("telescope").setup()
  --   end,
  -- },
}, {})


