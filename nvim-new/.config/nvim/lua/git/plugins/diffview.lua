---@module 'diffview'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'sindrets/diffview.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    cmd = {
        'DiffviewOpen',
        'DiffviewFileHistory',
        'DiffviewClose',
        'DiffviewToggleFiles',
        'DiffviewFocusFiles',
        'DiffviewRefresh',
        'DiffviewLog',
    },
    ---@type DiffviewConfig
    opts = {
        -- TODO: check out how it works
        enhanced_diff_hl = false,

        view = {
            default = {
                disable_diagnostics = false,
                winbar_info = true,
            },
            merge_tool = {
                disable_diagnostics = false,
                winbar_info = true,
            },
            file_history = {
                disable_diagnostics = false,
                winbar_info = true,
            },
        },

        -- TODO: set up mappings
    },
}
