local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- Syntax tree parser
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
        main = "nvim-treesitter.configs",
    },

    -- Embedded language aware comments
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- Syntax tree explorer
    {
        "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = {
            "TSPlaygroundToggle",
            "TSNodeUnderCursor",
            "TSCaptureUnderCursor",
            "TSHighlightCapturesUnderCursor",
        },
    },
}

return specs
