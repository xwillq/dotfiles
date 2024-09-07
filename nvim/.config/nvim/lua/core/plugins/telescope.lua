local Util = require('util')
local T = Util.telescope
local symbol_kinds = Util.lsp.symbol_kinds

---@type LazyPluginSpec
return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                Util.lazy.on_load('telescope.nvim', function()
                    require('telescope').load_extension('fzf')
                end)
            end,
        },
    },
    specs = {
        {
            'folke/which-key.nvim',
            optional = true,
            opts = {
                spec = {
                    { '<leader>s', group = 'Search and Goto' },
                },
            },
        },
    },
    cmd = 'Telescope',
    keys = {
        -- Files
        {
            '<leader>sf',
            T.picker('find_files', { hidden = true, no_ignore = true, no_ignore_parent = true }),
            desc = 'Find file',
        },
        { '<leader>sr', T.picker('oldfiles'), desc = 'Recent files' },

        -- Text
        { '<leader>sg', T.picker('live_grep'), desc = 'Grep' },

        -- Vim
        { '<leader>sh', T.picker('help_tags'), desc = 'Help pages' },
        { '<leader>sb', T.picker('buffers'), desc = 'Buffers' },

        -- Other
        { '<leader>sR', T.picker('resume'), desc = 'Resume previous search' },

        -- Code
        -- TODO: use this mapping if aerial is not installed
        -- { '<leader>ss', T.picker('lsp_document_symbols'), desc = 'Document symbols (LSP)' },
        { '<leader>sS', T.picker('lsp_dynamic_workspace_symbols'), desc = 'Workspace symbols (LSP)' },
        {
            '<leader>so',
            T.picker('lsp_dynamic_workspace_symbols', { symbols = symbol_kinds.class }),
            desc = 'Workspace classes (LSP)',
        },

        -- Shortcuts
        { '<leader>,', '<leader>sb', desc = 'Buffers', remap = true },
        { '<leader>/', '<leader>sg', desc = 'Grep', remap = true },
        { '<leader><leader>', '<leader>sf', desc = 'Find Files', remap = true },
    },
    opts = {
        defaults = {
            sorting_strategy = 'ascending',

            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    width = 0.9,
                },
                vertical = {
                    prompt_position = 'top',
                    width = 0.9,
                },
            },

            -- Fzf like icons
            prompt_prefix = '> ',
            selection_caret = '▌ ',
            multi_icon = ' ┃',

            -- path_display = {
            --     'truncate',
            -- },

            dynamic_preview_title = true,

            file_ignore_patterns = {
                '^.idea/',
                '^.git/',
                '.DS_Store'
            },
        },
    },
}
