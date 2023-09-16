local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- Work with git changes in current file
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = Util.lazy_opts(),
    },

    -- Git diff and merge tools for project
    -- TODO: configure
    {
        "sindrets/diffview.nvim",
        enabled = false,
        cmd = {
            "DiffviewOpen",
            "DiffviewFileHistory",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewLog",
        },
        opts = Util.lazy_opts(),
    }
}

return specs
