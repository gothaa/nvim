require'mason'.setup()
require'mason-lspconfig'.setup()

local lspconfig = require'lspconfig'
local coq = require'coq'

lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities {
   on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
         client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
               runtime = { version = 'LuaJIT'},
               workspace = {
                  checkThirdParty = false,
                  library = {
                     vim.env.VIMRUNTIME
                  }
               }
            }
         })
         client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
      end
      return true
   end
})

local servers = {'clangd', 'pyright'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(coq.lsp_ensure_capabilities {
  })
end
