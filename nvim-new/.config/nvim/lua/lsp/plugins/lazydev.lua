---@module 'lazydev'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'folke/lazydev.nvim',
    version = '*',
    ft = 'lua',
    cmd = 'LazyDev',
    ---@type lazydev.Config
    opts = {
        library = {
            { 'lazy.nvim', words = { 'lazy', 'Lazy' } },
        },
    },
}
