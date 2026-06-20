local keymap = vim.keymap.set

-- Paste from yank register
keymap('n', '<S-C-p>', '"0p')

-- Delete without yank
keymap('n', 'x', '"_x')

-- Increment/decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Select all
keymap('n', '<Leader>a', 'gg<S-v>G')

-- jj to ESC
keymap('i', 'jj', '<ESC>', { silent = true })

-- Remove search highlight
keymap('n', '<Esc>', ':noh<CR>', { silent = true })

-- Search with extended regex
keymap('n', '/', '/\\v')

-- Save with root permission
vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Search for selected text (forwards)
keymap('v', '*', function()
  local old_reg = vim.fn.getreg('"')
  local old_regtype = vim.fn.getregtype('"')
  vim.cmd('normal! gvy')
  local pattern = vim.fn.escape(vim.fn.getreg('"'), '/\\.*$^~[')
  pattern = pattern:gsub('%s+', '\\_s\\+')
  vim.fn.setreg('"', old_reg, old_regtype)
  vim.cmd('/' .. pattern)
end, { silent = true })

-- Search for selected text (backwards)
keymap('v', '#', function()
  local old_reg = vim.fn.getreg('"')
  local old_regtype = vim.fn.getregtype('"')
  vim.cmd('normal! gvy')
  local pattern = vim.fn.escape(vim.fn.getreg('"'), '?\\.*$^~[')
  pattern = pattern:gsub('%s+', '\\_s\\+')
  vim.fn.setreg('"', old_reg, old_regtype)
  vim.cmd('?' .. pattern)
end, { silent = true })

-- Save and Quit
keymap('n', '<Leader>s', ':w<CR>')
keymap('n', '<Leader>q', ':wq<CR>')
keymap('n', '<Leader>Q', ':q!<CR>')
