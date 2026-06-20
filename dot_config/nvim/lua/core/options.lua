vim.g.mapleader = ' '
vim.env.LANG = 'en_US.UTF-8'

vim.opt.number = true
vim.opt.fileencodings = { 'utf-8', 'sjis', 'euc-jp', 'latin' }
vim.opt.encoding = 'utf-8'
vim.opt.title = true
vim.opt.background = 'dark'
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.listchars = { tab = '»-', trail = '-', eol = '↲' }
vim.opt.list = true
vim.opt.inccommand = 'split'
vim.opt.lazyredraw = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append('**')
vim.opt.wildignore:append('*/node_modules/*')
vim.opt.clipboard:prepend({ 'unnamed', 'unnamedplus' })
vim.opt.formatoptions:append('r')
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.exrc = true
vim.opt.fillchars = { eob = ' ' }
