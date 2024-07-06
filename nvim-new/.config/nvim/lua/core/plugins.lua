local Util = require('util.lazy')

---@type LazyPluginSpec[]
return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            's1n7ax/nvim-window-picker',
        },
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
        },
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    {
        'folke/which-key.nvim',
        opts = Util.lazy_opts(),
        config = function(_, opts)
            local wk = require('which-key')
            wk.setup(opts)
            wk.register(opts.mappings)
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = Util.lazy_opts(),
        main = 'nvim-treesitter.configs',
    },

    {
        'windwp/nvim-autopairs',
        opts = {},
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            viewport_buffer = {
                min = 500,
            },
        },
    },

    {
        'assistcontrol/readline.nvim',
        config = function()
            local map = vim.keymap.set
            local readline = require('readline')

            map('!', '<C-a>', readline.beginning_of_line)
            map('!', '<C-e>', readline.end_of_line)
            map('!', '<M-f>', readline.forward_word)
            map('!', '<M-b>', readline.backward_word)
            map('!', '<C-k>', readline.kill_line)
            map('!', '<C-u>', readline.backward_kill_line) -- Preserve default keymap for insert?
            map('!', '<M-d>', readline.kill_word)
            map('!', '<M-BS>', readline.backward_kill_word)

            map('!', '<C-x><C-a>', '<C-a>')
        end,
    },

    {
        -- TODO: set up mappings or commands
        'echasnovski/mini.bufremove',
        opts = {},
    }
}
