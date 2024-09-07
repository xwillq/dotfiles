---@type LazyPluginSpec
return {
    'folke/edgy.nvim',
    version = '*',
    opts = {
        left = {
            {
                title = 'File tree',
                ft = 'neo-tree',
            },
            {
                title = 'Symbols',
                ft = 'aerial',
            },
        },
        right = {
            {
                title = 'Database',
                ft = 'dbui',
            },
        },

        animate = {
            enabled = false,
        },
    },
}
