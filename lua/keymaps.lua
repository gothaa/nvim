-- Add variable 
local map = vim.keymap.set
local mall = {'n', 'i', 'v'}

-- Setting leader key
vim.g.mapleader = '\\'

-- Add keymaps
map('n', '<F12>', '<cmd>NvimTreeOpen<cr>', {desc = 'Toggle Tree'})
map('', '<leader>R', '<esc><cmd>NvimRestart<cr>', {silent = true})
map(mall, '<c-s>', '<cmd>update<cr>', {silent = true, noremap = true, desc = 'Save file'})
map('n', '<c-Left>', '<c-w>h', {silent = true, noremap = false, desc = 'Move focuse to left'})
map('n', '<c-Down>', '<c-w>j', {silent = true, noremap = false, desc = 'Move focuse to down'})
map('n', '<c-Up>', '<c-w>k',  {silent = true, noremap = false, desc = 'Move focuse to up'})
map('n', '<c-Right>', '<c-w>l', {silent = true, noremap = false, desc = 'Move focuse to right'})
