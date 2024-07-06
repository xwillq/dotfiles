return {
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

    change_detection = {
        notify = false,
    },

    diff = {
        cmd = 'diffview.nvim',
    },

    ui = {
        backdrop = 100,
        custom_keys = {
            ['gf'] = {
                ---@param plugin LazyPlugin
                function(plugin)
                    vim.cmd.cd(plugin.dir)
                    vim.notify('Changed directory to ' .. plugin.dir)
                    vim.cmd.close()
                end,
                desc = 'cd to plugin directory',
            },

            ['<localleader>l'] = false,
        },
    },
}
