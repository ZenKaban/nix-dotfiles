vim.g.mapleader = " "
-- Run
vim.keymap.set('n', '<leader>r', ':!python %<CR>')
-- NeoTree
-- vim.keymap.set('n', '<leader>e', ':Neotree float reveal<CR>')
-- vim.keymap.set('n', '<leader>E', ':Neotree toggle<CR>')
-- vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
-- vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Terminal
-- vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
-- vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
-- vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=90<CR>')
vim.keymap.set('n', '<leader>t', ':HauntTerm -t scratch')
--LazyGit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

-- vim.keymap.set('v', '<leader>p', '"+p')
-- vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('x', '<leader>p', '"_dP')
