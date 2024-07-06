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


--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

require('lazy').setup({
    spec = {
        { import = 'core.plugins' },
        { import = 'formatting.plugins' },
        { import = 'git.plugins' },
        { import = 'ui.plugins' },
        { import = 'lsp.plugins' },
    },

    install = {
        colorscheme = { 'material' },
    },

    -- Check for plugin updates automatically
    checker = {
        enabled = true,
        notify = true,
        frequency = 86400, -- Every day
        check_pinned = true,
    },

    ui = {
        custom_keys = {
            ['gf'] = {
                ---@param plugin LazyPlugin
                function(plugin)
                    vim.cmd.cd(plugin.dir)
                    vim.notify("Changed directory to " .. plugin.dir)
                    vim.cmd.close()
                end,
                desc = 'cd to plugin directory',
            },

            ["<localleader>l"] = false,
        },
    }
})
