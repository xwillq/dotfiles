---@module 'ibl'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = {
        'IBLEnable',
        'IBLDisable',
        'IBLToggle',
        'IBLEnableScope',
        'IBLDisableScope',
        'IBLToggleScope',
    },
    main = 'ibl',
    ---@type ibl.config.full
    opts = {
        viewport_buffer = {
            min = 500,
        },
    },
}
