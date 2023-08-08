-- Auto downloads when its does exisnt
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   print('Installing lazy package manager...')
   vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath
   })
   print('Done')
end

-- Starting
vim.opt.rtp:prepend(lazypath)

-- List plugins (lazy)
local plugins_lazy = {
   'sitiom/nvim-numbertoggle',
   {
      'nvim-tree/nvim-web-devicons',
      lazy = true
   },
   {
      'nvim-tree/nvim-tree.lua',
      keys = {
         { '<F12>', '<cmd>NvimTreeOpen<cr>', mode = 'n' }
      }
   },
   'nvim-lualine/lualine.nvim',
   {
      'nvim-treesitter/nvim-treesitter',
      cmd = 'TSUpdate'
   },
   'folke/tokyonight.nvim',
   {
      'folke/which-key.nvim',
      event = 'VeryLazy',
   },
   {
      'williamboman/mason.nvim',
      dependencies = {
         'williamboman/mason-lspconfig.nvim'
      }
   },
   'neovim/nvim-lspconfig',
   {
      "utilyre/barbecue.nvim",
      name = "barbecue",
      dependencies = {
         "SmiteshP/nvim-navic",
      }
   },
   {
      'hrsh7th/nvim-cmp',
      --event = 'InsertEnter',
      dependencies = {
          'petertriho/cmp-git',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-cmdline',
         {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            dependencies = {
               'rafamadriz/friendly-snippets'
            }
         },
         'saadparwaiz1/cmp_luasnip'
      }
   }
}

-- Lazy settings
local opts_lazy = {
   defaults = {
      lazy = true
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
require("lazy").setup(plugins_lazy, opts_lazy)
