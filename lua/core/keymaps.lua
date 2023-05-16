local o = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- better navigation between windows
k("n", "<C-h>", "<C-w>h", o)
k("n", "<C-j>", "<C-w>j", o)
k("n", "<C-k>", "<C-w>k", o)
k("n", "<C-l>", "<C-w>l", o)

-- focus and toggel nvimtree 
k("n", "<leader>e", ":NvimTreeFocus<CR>", o)
k("n", "<leader>n", ":NvimTreeToggle<CR>", o)

-- resize windows
k("n", "<M-Up>", ":resize +2<CR>", o)
k("n", "<M-Down>", ":resize -2<CR>", o)
k("n", "<M-Left>", ":vertical resize -2<CR>", o)
k("n", "<M-Right>", ":vertical resize +2<CR>", o)

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
k('n', '<leader>ff', ":Telescope find_files <CR>", o)
k('n', '<leader>fg', ":Telescope live_grep <CR>", o)
k('n', '<leader>fb', ":Telescope buffers <CR>", o)
