return {
    filesystem = {
        closed_dir = " ",
        opened_dir = " ",
        closed_empty_dir = " ",
        opened_empty_dir = " ",
    },
    diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
    },
    git = {
        -- Git status for file
        file = {
            staged = "+",
            unstaged = "!",
            removed = "-",
            untracked = "?",
            stash = "*",
            conflict = "~",
            ignored = "\\",
            renamed = "→",
        },
        -- Git status for text (ex. buffer contents)
        text = {
            added = "+",
            modified = "~",
            removed = "-",
        },
    },
}
