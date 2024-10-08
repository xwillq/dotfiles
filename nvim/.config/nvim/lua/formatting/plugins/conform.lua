---@module 'conform'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'stevearc/conform.nvim',
    version = '*',
    lazy = true,
    cmd = 'ConformInfo',
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            sql = { 'sqlfmt' },
        },
    },
}
