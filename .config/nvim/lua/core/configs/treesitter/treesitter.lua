return {
    -- A list of parsers that must always be installed
    ensure_installed = {
        -- Vim
        "vim",
        "lua",
        "vimdoc",

        -- Git
        "git_config",
        "git_rebase",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "diff",

        -- Docker
        "dockerfile",

        -- General files
        "json",
        "json5",
        "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        -- Disable default Neovim syntax highlighting
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
}
