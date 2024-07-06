local Util = require('util.lazy')

---@type LazyPluginSpec[]
return {
    {
        'lewis6991/gitsigns.nvim',
        opts = Util.lazy_opts(),
    },

    {
        'sindrets/diffview.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = Util.lazy_opts(),
    },

    -- {
    --     'NeogitOrg/neogit',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-telescope/telescope.nvim',
    --         -- 'sindrets/diffview.nvim',        -- optional - Diff integration
    --     },
    --     opts = Util.lazy_opts(),
    -- }
}
