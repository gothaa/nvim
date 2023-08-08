-- Add variable
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
   if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
   end
end

-- Setup mason
require('mason').setup()
require('mason-lspconfig').setup()

-- Lsp settings
lspconfig.lua_ls.setup({
   cmd = { 'lua-language-server' },
   capabilities = capabilities,
   on_attach = on_attach,
   settings = {
      Lua = {
         runtime = {
            version = 'LuaJIT'
         },
         diagnostics = {
            globals = { 'vim' }
         }
      }
   }
})
lspconfig.rome.setup({
   cmd = { 'rome', 'lsp-proxy' },
   capabilities = capabilities,
   on_attach = on_attach
})
lspconfig.pyright.setup({
   cmd = { 'pyright' },
   capabilities = capabilities,
   on_attach = on_attach
})
lspconfig.clangd.setup({
   cmd = { 'clangd' },
   capabilities = capabilities,
   on_attach = on_attach,
   offset_encoding = 'utf-8'
})
