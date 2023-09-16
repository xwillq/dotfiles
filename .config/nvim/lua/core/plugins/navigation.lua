local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        },
        cmd = "Neotree",
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        cmd = "Telescope",
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    -- Code problem viewer
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    -- List and go to comments with keywords
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },
}

return specs
