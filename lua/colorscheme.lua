-- Setting tokyonight
require('catppuccin').setup({
   flavour = 'macchiato',
   background = {
      dark = 'macchiato',
      light = 'latte'
   },
   transparent_background = true,
   show_end_of_buffer = false,
   term_colors = true,
   dim_inactive = {
      enabled = true,
      shade = 'dark',
      percentage = 0.6
   },
   no_italic = false,
   no_bold = false,
   no_underline = false,
   intergrations = {
      treesitter = true,
      nvimtree = true,
      cmp = true,
      barbecue = {
         dim_dirname = true,
         bold_basename = true,
         dim_context = false,
         alt_background = true
      }
   },
      mason = true,
      navic = {
         enabled = true
      },
      native_lsp = {
         enabled = true,
         virtual_text = {
            errors = { 'italic' },
            hints = { 'bold' },
            warnings = { 'italic', 'bold' },
            information = { 'italic' }
         },
         underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline'}
         },
         inlay_hints = {
            background = true
         }
      }
})

-- Start the theme
vim.cmd.colorscheme('catppuccin')
