vim.g.mapleader = " "
vim.keymap.set('n', '<leader>q', vim.cmd.Ex, { desc = 'Open file explorer' })
vim.keymap.set('i', '<C-j>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-j>'
end, { expr = true, noremap = true })

vim.keymap.set('i', '<C-k>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-k>'
end, { expr = true, noremap = true })
