-- Auto downloads when its does exisnt
local lazypath = vim.fn.stdpath'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   print'Installing lazy package manager...'
   vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath
   }
   print'Done'
end

-- Starting
vim.opt.rtp:prepend(lazypath)

-- List plugins (lazy)
local plugins_lazy = {
   {
      'neovim/nvim-lspconfig',
      lazy = false,
   },
   {
         'williamboman/mason.nvim',
         dependencies = {
            'williamboman/mason-lspconfig.nvim'
         }
   },
   {
      'utilyre/barbecue.nvim',
      name = 'barbecue',
      dependencies = {
         'SmiteshP/nvim-navic'
      }
   },
   {
      'ms-jpq/coq_nvim',
      branch = 'coq',
      build = 'python -m coq deps',
      cmd = 'COQnow',
      dependencies = {
         {'ms-jpq/coq.artifacts', branch = 'artifacts'},
         {'ms-jpq/coq.thirdparty', branch = '3p'}
      }
   },
   {
      'sitiom/nvim-numbertoggle',
      lazy = false
   },
   {
      'nvim-tree/nvim-web-devicons',
      lazy = true
   },
   'nvim-tree/nvim-tree.lua',
   'nvim-lualine/lualine.nvim',
   {
      'nvim-treesitter/nvim-treesitter',
      cmd = 'TSUpdate'
   },
   {
      'folke/which-key.nvim',
      event = 'VeryLazy',
   },
   'NvChad/nvim-colorizer.lua',
   'folke/tokyonight.nvim'
}

-- Lazy settings
local opts_lazy = {
   defaults = {
      lazy = false
   },
   install = {
      colorscheme = { 'tokyonight' },
      missing = true
   },
   diff = {
      cmd = 'git'
   },
   performance = {
      reset_packpath = true,
      rtp = {
         disabled_plugins = {
            'gzip',
            'netrwPlugin',
            'zipPlugin',
         }
      },
      cache = {
         enable = true
      }
   }
}

-- Starting lazy
require'lazy'.setup(plugins_lazy, opts_lazy)
