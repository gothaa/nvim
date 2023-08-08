-- Add variable
local cmp = require('cmp')

-- Cmp Settings
cmp.setup({
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end
   },
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
   },
   mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping.abort(),
      ['<cr>'] = cmp.mapping.confirm({ select = true })
   }),
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
   },{ { name = 'buffer' }
   })
})
cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
      { name = 'git' },
   }, { { name = 'buffer' }
   })
})
cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = 'buffer' }
   }
})
cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})
