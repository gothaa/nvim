-- Setting tokyonight
require('tokyonight').setup({
   style = 'moon',
   light_style = 'day',
   transparent = false,
   terminal_colors = true
})

-- Start the theme
vim.cmd.colorscheme('tokyonight')
