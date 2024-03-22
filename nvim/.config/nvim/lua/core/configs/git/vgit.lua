return {
    settings = {
        -- git = {
        --     fallback_args = {
        --         "--git-dir",
        --         vim.fn.expand("$HOME/.local/share/yadm/repo.git"),
        --     },
        -- }
        live_blame = {
            enabled = false,
        },
        live_gutter = {
            enabled = true,
            edge_navigation = true,
        },
        authorship_code_lens = {
            enabled = false,
        },
        scene = {
            diff_preference = 'unified', -- unified or split
            keymaps = {
                quit = 'q'
            }
        },
    }
}
