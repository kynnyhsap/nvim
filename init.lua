require "core.options"
require "core.keymaps"

vim.cmd[[colorscheme habamax]]

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



local plugins = {
		{ "folke/which-key.nvim", }
}

local opts = {}

require("lazy").setup(plugins, opts)