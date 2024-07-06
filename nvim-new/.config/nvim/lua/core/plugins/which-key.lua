---@module 'which-key'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'folke/which-key.nvim',
    version = '*',
    opts_extend = { 'spec' },
    ---@type wk.Opts
    opts = {
        win = {
            border = 'single',
            -- Extra space inside of window [top/bottom, right/left]
            padding = { 0, 1 },
        },
        layout = {
            spacing = 3, -- Space between columns
            align = 'center', -- Column alignment
        },
        disable = {
            buftypes = {},
            filetypes = {
                'neo-tree',
            },
        },
        icons = {
            rules = false,
        },

        spec = {
            { '<C-w>c', group = 'Close window' },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')

        -- Remove key from options in case it is added to which-key config
        local mappings = opts.mappings
        opts.mappings = nil

        wk.setup(opts)

        -- wk.add(mappings)
    end,
}
