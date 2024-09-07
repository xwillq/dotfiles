---@type LazyPluginSpec
return {
    'NeogitOrg/neogit',
    enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- 'sindrets/diffview.nvim', -- optional - Diff integration
    },
    opts = {},
}
