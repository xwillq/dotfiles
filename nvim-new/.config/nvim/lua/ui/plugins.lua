local Util = require('util.lazy')

---@type LazyPluginSpec[]
return {
    {
        'marko-cerovac/material.nvim',
        -- dir = '~/Projects/nvim/material.nvim',
        -- dependencies = {
        --     'loganswartz/polychrome.nvim',
        -- },
        lazy = false,
        priority = 9000,
        config = function(_, opts)
            require('material').setup(opts)
            vim.cmd.colorscheme('material-darker')
        end,
        opts = Util.lazy_opts(),
    },

    -- {
    --     'nvimdev/dashboard-nvim',
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     event = 'VimEnter',
    --     opts = Util.lazy_opts(),
    -- },
}
