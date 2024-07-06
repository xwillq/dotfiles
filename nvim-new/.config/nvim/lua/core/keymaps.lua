-- vim.cmd('source ' .. vim.env.XDG_CONFIG_HOME .. '/nvim/share/keymaps.vim')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

--------------------------------------------------------------------------------
-- Tab, window and buffer navigation
--------------------------------------------------------------------------------

-- Tabs
-- map('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })
-- map('n', ']t', '<cmd>tabnext<cr>', { desc = 'Next tab' })
-- map('n', '[T', '<cmd>tabfirst<cr>', { desc = 'First tab' })
-- map('n', ']T', '<cmd>tablast<cr>', { desc = 'Last tab' })
-- map('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = 'New tab' })
-- map('n', '<leader>td', '<cmd>tabclose<cr>', { desc = 'Close tab' })
-- map('n', '<leader>tt', '<C-Tab>', { desc = 'Other tab' })

-- Windows
-- map('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
-- map('n', '<leader>wd', '<C-W>c', { desc = 'Close window', remap = true })
-- map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
-- map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
-- map('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
-- map('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

-- Buffers
-- if Util.has('bufferline.nvim') then
--   map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
--   map('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
-- else
--   map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
--   map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
-- end
-- map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
-- map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
-- map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Close buffer' })
-- map('n', '<leader>bD', '<cmd>bdelete!<cr>', { desc = 'Close buffer (force)' })
-- map('n', '<leader>bb', '<C-^>', { desc = 'Other buffer' })
-- map('n', '<leader>`', '<C-^>', { desc = 'Other buffer' })

-- Navigate windows using the Ctrl+h/j/k/l keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to the left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to the down window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to the up window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to the right window' })

--------------------------------------------------------------------------------
-- Buffer navigation
--------------------------------------------------------------------------------

-- Center cursor after moving with Ctrl+d/u/f/b
-- map({ 'n', 'v'}, '<C-d>', '<C-d>zz')
-- map({ 'n', 'v'}, '<C-u>', '<C-u>zz')
-- map({ 'n', 'v'}, '<C-f>', '<C-f>zz')
-- map({ 'n', 'v'}, '<C-b>', '<C-b>zz')

--------------------------------------------------------------------------------
-- Editing
--------------------------------------------------------------------------------

-- Use system clipboard with leader+p/P/y/Y
map({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste after cursor from system clipboard' })
map({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste before cursor from system clipboard' })
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank text to system clipboard' })
map({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank lines to system clipboard' })

--------------------------------------------------------------------------------
-- Other
--------------------------------------------------------------------------------

-- Clear search with <esc>
map('n', '<esc>', '<cmd>noh<cr>', { desc = 'Escape and clear hlsearch' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>')

-- better up/down
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--     'n',
--     '<leader>ur',
--     '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
--     { desc = 'Redraw / clear hlsearch / diff update' }
-- )

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

--keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- new file
-- map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
-- map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })
