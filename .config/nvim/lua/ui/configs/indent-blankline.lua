return {
    use_treesitter = true,

    -- Maximum indentation level to display
    indent_level = 10,

    -- Set to 1, so aligned multiline comments don't create indentation guides
    max_indent_increase = 1,

    show_first_indent_level = true,

    -- Don't show trailing guide on empty lines
    show_trailing_blankline_indent = false,

    -- If tabs are used for indentation, show guides only for tabs
    -- Usefull when tabs are used for indentation and spaces are used for alignment
    strict_tabs = true,

    show_current_context = true,
    show_current_context_start_on_current_line = true,
    use_treesitter_scope = true,

    -- Don't show guides in this files
    filetype_exclude = {
        "help",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
    },

    -- Don't show guides in buffers with this types
    buftype_exclude = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
    },
}
