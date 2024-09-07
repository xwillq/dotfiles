---@module 'which-key'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'folke/which-key.nvim',
    version = '*',
    opts_extend = { 'spec' },
    ---@type wk.Opts
    opts = {
        -- Don't show immediately after entering visual mode
        ---@param ctx { mode: string, operator: string }
        defer = function(ctx)
            return vim.list_contains({ 'v', 'V', '<C-V>' }, ctx.mode)
        end,
        -- Show immediately on plugins (spell, marks, registers)
        -- and delay in other cases
        ---@param ctx { keys: string, mode: string, plugin?: string }
        delay = function(ctx)
            return ctx.plugin and 0 or 500
        end,
        disable = {
            buftypes = {},
            filetypes = {
                'neo-tree',
            },
        },

        preset = 'modern',
        win = {
            border = 'single',
            -- Extra space inside of window [top/bottom, right/left]
            padding = { 0, 1 },
        },
        icons = {
            mappings = false,
        },

        -- spec = {
        --     { '<C-w>c', group = 'Close window' },
        -- },
    },
}
