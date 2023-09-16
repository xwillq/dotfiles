return {
    -- Show icons in the signs column
    signs = true,
    -- Sign priority
    sign_priority = 8,

    gui_style = {
        -- The GUI style to use for the fg highlight group
        fg = "NONE",
        -- The GUI style to use for the bg highlight group
        bg = "BOLD",
    },

    -- Comment highlighting in editor
    highlight = {
        -- Enable multiline TODO comments
        multiline = true,
        -- Highlighting style for characters before keyword
        before = "",
        -- Highlighting style for keyword
        keyword = "bg",
        -- Highlighting style for characters after keyword
        after = "fg",
        -- Ignore lines longer than 400
        max_line_len = 400,
    },

    -- Configuration of search command
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",

            -- Exclude files
            "--glob=!*.js",
        },
        -- Regex for matching keywords
        pattern = [[\b(KEYWORDS):]],
    },
}
