local Util = require('util')

---@type LazyPluginSpec
return {
    'stevearc/aerial.nvim',
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    specs = {
        {
            'nvim-telescope/telescope.nvim',
            optional = true,
            keys = {
                { '<leader>ss', Util.telescope.picker('aerial.aerial'), desc = 'File structure' },
            },
            opts = function()
                Util.lazy.on_load('telescope.nvim', function()
                    require('telescope').load_extension('aerial')
                end)
            end,
        }
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = {
        'AerialToggle',
        'AerialOpen',
        'AerialOpenAll',
        'AerialClose',
        'AerialCloseAll',
        'AerialNext',
        'AerialPrev',
        'AerialGo',
        'AerialInfo',
        'AerialNavToggle',
        'AerialNavOpen',
        'AerialNavClose',
    },
    opts = {
        backends = { 'lsp', 'treesitter' },

        layout = {
            default_direction = 'left',
            placement = 'edge',
        },

        attach_mode = 'global',

        -- A list of all symbols to display. Set to false to display all symbols.
        -- This can be a filetype map (see :help aerial-filetype-map)
        -- To see all available values, see :help SymbolKind
        filter_kind = vim.list_extend(
            Util.lsp.symbol_kinds.class,
            Util.lsp.symbol_kinds['function']
        ),

        -- Determines line highlighting mode when multiple splits are visible.
        -- split_width   Each open window will have its cursor location marked in the
        --               aerial buffer. Each line will only be partially highlighted
        --               to indicate which window is at that location.
        -- full_width    Each open window will have its cursor location marked as a
        --               full-width highlight in the aerial buffer.
        -- last          Only the most-recently focused window will have its location
        --               marked in the aerial buffer.
        -- none          Do not show the cursor locations in the aerial window.
        highlight_mode = 'split_width',

        -- Highlight the closest symbol if the cursor is not exactly on one.
        highlight_closest = false,

        -- Highlight the symbol in the source buffer when cursor is in the aerial win
        highlight_on_hover = false,

        -- When jumping to a symbol, highlight the line for this many ms.
        -- Set to false to disable
        highlight_on_jump = 300,

        -- Jump to symbol in source window when the cursor moves
        autojump = false,

        -- Use symbol tree for folding. Set to true or false to enable/disable
        -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
        -- This can be a filetype map (see :help aerial-filetype-map)
        manage_folds = false,

        -- When you fold code with za, zo, or zc, update the aerial tree as well.
        -- Only works when manage_folds = true
        link_folds_to_tree = false,

        -- Fold code when you open/collapse symbols in the tree.
        -- Only works when manage_folds = true
        link_tree_to_folds = true,

        -- Show box drawing characters for the tree hierarchy
        show_guides = false,
    },
}
