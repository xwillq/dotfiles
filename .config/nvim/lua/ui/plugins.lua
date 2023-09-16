local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- Material theme
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 9000,
        opts = Util.lazy_opts(),
        config = function(_, opts)
            vim.g.material_style = "darker"
            require("material").setup(opts)
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = Util.lazy_opts(),
    },

    -- Buffer line
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = Util.lazy_keys(),
        opts = Util.lazy_opts(),
    },

    -- Indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = Util.lazy_opts(),
        config = function(_, opts)
            require("indent_blankline").setup(opts)

            local hl
            for _, highlight in pairs({
                "IndentBlanklineSpaceChar",
                "IndentBlanklineSpaceCharBlankline",
                "IndentBlanklineContextSpaceChar",
            }) do
                hl = vim.api.nvim_get_hl(0, { name = highlight })
                hl.fg = nil
                hl.nocombine = nil
                hl.cterm = nil
                vim.api.nvim_set_hl(0, highlight, hl)
            end
        end,
    },

    -- Dynamic `colorcolumn`
    {
        "Bekaboo/deadcolumn.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- Better highlight of matching parenthesis
    {
        "utilyre/sentiment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        init = function()
            vim.g.loaded_matchparen = 1
        end,
        config = true,
    },

    -- Keymap cheat sheet 
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = Util.lazy_opts(),
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },

    -- Better notifications
    --{
    --    "rcarriga/nvim-notify",
    --    event = "VeryLazy",
    --    keys = Util.lazy_keys(),
    --    opts = Util.lazy_opts(),
    --    init = function()
    --        vim.notify = require("notify")
    --    end,
    --},

    -- Better UI
    --{
    --    "folke/noice.nvim",
    --    dependencies = {
    --        "MunifTanjim/nui.nvim",
    --        "rcarriga/nvim-notify",
    --    },
    --    event = "VeryLazy",
    --    keys = Util.lazy_keys(),
    --    opts = Util.lazy_opts(),
    --},

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}

return specs
