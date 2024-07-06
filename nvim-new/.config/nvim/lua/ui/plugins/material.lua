---@type LazyPluginSpec
return {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 9000,
    config = function(_, opts)
        require('material').setup(opts)
        vim.cmd.colorscheme('material-darker')
    end,
    opts = {
        contrast = {
            terminal = false, -- Enable contrast for the built-in terminal
            sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
            floating_windows = true, -- Enable contrast for floating windows
            cursor_line = false, -- Enable darker background for the cursor line
            lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
            non_current_windows = false, -- Enable darker background for non-current windows
            filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
            comments = { italic = true },
            strings = {},
            keywords = {},
            functions = {},
            variables = {},
            operators = {},
            types = {},
        },

        disable = {
            -- TODO: reset cursor when exiting Nvim and enable this option
            colored_cursor = true, -- Disable the colored cursor
            borders = false, -- Disable borders between verticaly split windows
            background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
            term_colors = false, -- Prevent the theme from setting terminal colors
            eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
            lighter = false, -- Enable higher contrast text for lighter style
            darker = true, -- Enable higher contrast text for darker style
        },

        lualine_style = 'stealth', -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil, -- If you want to override the default colors, set this to a function

        custom_highlights = { -- Overwrite highlights with your own
            DiffAdd = { bg = '#2F4A35' },
            DiffChange = { bg = '#1F2D31' },
            DiffDelete = { bg = '#4B1515' },
            DiffText = { bg = '#203F4A' },

            SpellBad = { undercurl = true, sp = '#F07178' },
            SpellCap = { undercurl = true, sp = '#82AAFF' },
            SpellLocal = { undercurl = true, sp = '#89DDFF' },
            SpellRare = { undercurl = true, sp = '#C792EA' },
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
            -- Available plugins:
            -- 'coc',
            -- 'colorful-winsep',
            -- 'dap',
            'dashboard',
            -- 'eyeliner',
            -- 'fidget',
            -- 'flash',
            'gitsigns',
            -- 'harpoon',
            -- 'hop',
            -- 'illuminate',
            'indent-blankline',
            -- 'lspsaga',
            -- 'mini',
            'neogit',
            -- 'neotest',
            'neo-tree',
            -- 'neorg',
            -- 'noice',
            -- 'nvim-cmp',
            -- 'nvim-navic',
            -- 'nvim-tree',
            'nvim-web-devicons',
            -- 'rainbow-delimiters',
            -- 'sneak',
            'telescope',
            -- 'trouble',
            'which-key',
            -- 'nvim-notify',

            -- TODO: add diffview
            -- TODO: add vgit
            -- TODO: add todo-comments
            -- TODO: add vim-be-good
            -- TODO: add bufferline
        },
    },
}
