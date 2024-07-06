local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('core.autocmds')
require('core.options')
require('core.keymaps')

require('ui.autocmds')
-- require('ui.options')
-- require('ui.keymaps')

require('formatting.autocmds')
-- require('formatting.options')
-- require('formatting.keymaps')

-- require('git.autocmds')
-- require('git.options')
-- require('git.keymaps')

-- require('lsp.autocmds')
-- require('lsp.options')
-- require('lsp.keymaps')

-- require('core.filetype')


_G.Util = require('util')


--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

require('lazy').setup(
    {
        { 'folke/lazy.nvim', version = '*' },
        { import = 'core.plugins' },
        { import = 'formatting.plugins' },
        { import = 'git.plugins' },
        { import = 'ui.plugins' },
        { import = 'lsp.plugins' },
    },
    require('core.lazy')
)
