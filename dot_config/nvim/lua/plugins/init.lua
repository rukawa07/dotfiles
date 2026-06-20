-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Colorscheme
  {
    'nordtheme/vim',
    name = 'nord',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme nord')
    end,
  },

  -- Auto pairs
  { 'cohama/lexima.vim' },

  -- Commenting
  {
    'preservim/nerdcommenter',
    config = function()
      require('plugins.nerdcommenter')
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.lualine')
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      require('plugins.lspconfig')
    end,
  },

  -- Lspsaga
  {
    'nvimdev/lspsaga.nvim',
    dependencies = { 'nvim-lspconfig' },
    config = function()
      require('plugins.lspsaga')
    end,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      require('plugins.cmp')
    end,
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && npx --yes yarn install',
  },

  -- Fuzzy finder
  { 'ibhagwan/fzf-lua', branch = 'main' },
})
