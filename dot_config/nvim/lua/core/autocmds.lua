-- File type detection
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.es6',
  command = 'setf javascript',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.tsx',
  command = 'setf typescriptreact',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.md',
  command = 'set filetype=markdown',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.flow',
  command = 'set filetype=javascript',
})

vim.opt.suffixesadd:append({ '.js', '.es', '.jsx', '.json', '.css', '.less', '.sass', '.styl', '.php', '.py', '.md' })

-- Filetype-specific indentation
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'coffee', 'ruby', 'yaml' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
})

-- Transparent background (requires terminal emulator transparency)
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    local groups = { 'Normal', 'NormalNC', 'NormalFloat', 'SignColumn', 'EndOfBuffer' }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = 'NONE', ctermbg = 'NONE' })
    end
    vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 240, fg = '#2b506e', bg = 'NONE', ctermbg = 'NONE' })
  end,
})

-- Cursor line highlight toggle
local bg_highlight = vim.api.nvim_create_augroup('BgHighlight', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
  group = bg_highlight,
  pattern = '*',
  command = 'set cursorline',
})
vim.api.nvim_create_autocmd('WinLeave', {
  group = bg_highlight,
  pattern = '*',
  command = 'set nocursorline',
})
