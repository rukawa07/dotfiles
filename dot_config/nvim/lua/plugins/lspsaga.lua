require('lspsaga').setup({})

local keymap = vim.keymap.set

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { silent = true })
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', { silent = true })
keymap('n', 'gh', '<Cmd>Lspsaga finder<CR>', { silent = true })
