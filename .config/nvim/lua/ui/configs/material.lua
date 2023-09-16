local colors = require("material.colors")
colors = require("material.colors.conditionals")

return {
    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neorg",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
        -- TODO: add diffview
        -- TODO: add vgit
        -- TODO: add neo-tree
        -- TODO: add todo-comments
        -- TODO: add vim-be-good
        -- TODO: add bufferline
    },

    disable = {
        -- TODO: reset cursor when exiting Nvim and enable this option
        colored_cursor = true, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = true, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true  -- Enable higher contrast text for darker style
    },

    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

--    custom_colors = function(colors) -- Overwrite the default colors
--        colors.editor.bg_alt = "#212121"
--    end,

    custom_highlights = {
        SpellBad = { sp = colors.main.red, undercurl = true },
        SpellCap = { sp = colors.main.blue, undercurl = true },
        SpellLocal = { sp = colors.main.cyan, undercurl = true },
        SpellRare = { sp = colors.main.purple, undercurl = true },
    }, -- Overwrite highlights with your own
}
