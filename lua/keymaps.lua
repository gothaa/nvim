-- Add variable 
local map = vim.keymap.set
local mall = { 'n', 'i', 'v' }

-- Setting leader key
vim.g.mapleader = '\\'

-- Add keymaps
map( '', '<leader>R', '<esc><cmd>NvimRestart<cr>', { silent = true } )
map( mall, '<c-s>', '<cmd>update<cr>' )
map( 'n', '<c-Left>', '<c-w>h' )
map( 'n', '<c-Down>', '<c-w>j' )
map( 'n', '<c-Up>', '<c-w>k' )
map( 'n', '<c-Right>', '<c-w>l' )
