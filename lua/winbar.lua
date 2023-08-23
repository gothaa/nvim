-- Add variable
local barbecue = require('barbecue.ui')

-- Setup navic
require('nvim-navic').setup({
   highlight = true
})

-- Setup barbecue
require('barbecue').setup({
   theme = 'catppuccin',
   attach_nvic = false,
   create_autocmd = false
})
vim.api.nvim_create_autocmd({
   'WinResized',
   'BufWinEnter',
   'CursorHold',
   'InsertLeave',
   'BufModifiedSet'
}, {
   group = vim.api.nvim_create_augroup("barbecue.updater", {}),
   callback = function()
      barbecue.update()
   end,
})

-- Start barbecue
barbecue.toggle(true)
