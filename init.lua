-- 
-- options
--
vim.opt.wrap = false
vim.opt.number = true
vim.opt.scrolloff = 16


-- 
-- keymaps
--
local o = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

-- remap space as a leader key
k("", "<Space>", "<Nop>", o)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigate within insert mode  
k("i", "<C-h>", "<Left>", o)
k("i", "<C-j>", "<Down>", o)
k("i", "<C-k>", "<Up>", o)
k("i", "<C-l>", "<Right>", o)

-- switch between buffers
k("n", "<TAB>", ":bnext<CR>", o)
k("n", "<S-TAB>", ":bprev<CR>", o)
-- close buffer 
k("n", "<leader>bd", ":bd<CR>", o)

-- toggle Exploer Tree
k("n", "<leader>e", ":Ex<CR>", o)

-- lsp staff
k("n", "<leader>ll", ":lua vim.lsp.buf.format()<CR>", o)
k("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", o)
k("n", "gd", ":lua vim.lsp.buf.definition()<CR>", o)
k("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", o)

-- move line up and down
k("n", "<M-j>", ":m+1<CR>==", o)
k("n", "<M-k>", ":m-2<CR>==", o)
k("v", "<M-k>", ":m '<-2<CR>gv=gv", o)
k("v", "<M-j>", ":m '>+1<CR>gv=gv", o)
k("i", "<M-j>", "<Esc>:m .+1<CR>==gi", o)
k("i", "<M-k>", "<Esc>:m .-2<CR>==gi", o)

-- prevent yanking selection when pasting
k("v", "p", '"_dP', o)

-- fuzzy find 
-- k('n', '<leader>ff', ":Telescope find_files <CR>", o)
-- k('n', '<leader>fg', ":Telescope live_grep <CR>", o)
-- k('n', '<leader>fb', ":Telescope buffers <CR>", o)


--
-- plugins
--

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


  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  { "lewis6991/gitsigns.nvim" },

  "tpope/vim-sleuth",

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   tag = "0.1.1",
  --   config = function()
  --     require("telescope").setup()
  --   end,
  -- },
}, {})


