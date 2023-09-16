local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP autocompletions
            "hrsh7th/cmp-path", -- Path autocompletions
            "f3fora/cmp-spell", -- Spelling autocompletion
            "hrsh7th/cmp-buffer", -- Words from current buffer
            "hrsh7th/cmp-cmdline", -- Nvim command line autocompletions
            "davidsierradz/cmp-conventionalcommits", -- Conventional commit types
            "saadparwaiz1/cmp_luasnip", -- Snippets from LuaSnip
            "windwp/nvim-autopairs", -- Insert parenthesis after function name completion
        },
        opts = Util.lazy_opts(),
        ---@param opts CmpConfig
        config = function(_, opts)
            local cmp = require("cmp")
            cmp.setup(opts.global)
            for _, value in pairs(opts.filetype) do
                cmp.setup.filetype(value.type, value.config)
            end
            for _, value in pairs(opts.cmdline) do
                cmp.setup.cmdline(value.type, value.config)
            end

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            --local config = require("cmp.config")
            --vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
            --    desc = "Start completion",
            --    callback = function()
            --        if config.enabled() then
            --            util.debounce(200, function()
            --                cmp.core:on_change('TextChanged')
            --            end)
            --        end
            --    end
            --})
        end,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        event = { "InsertEnter", "CmdlineEnter" },
    },

    -- Comment shortcuts
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        opts = Util.lazy_opts(),
    },

    -- Highlight word under cursor
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = Util.lazy_opts(),
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },

    -- Insert pair characters (like parenthesis and quotes) and type over
    {
        "windwp/nvim-autopairs",
        event = { "BufReadPost", "BufNewFile" },
        opts = Util.lazy_opts(),
    },

    -- Surround regions with parenthesis and quotes
    {
        "echasnovski/mini.surround",
        event = { "BufReadPost", "BufNewFile" },
        opts = Util.lazy_opts(),
    },

    -- Better text objects for `a` and `i` movements
    {
        "echasnovski/mini.ai",
        event = { "BufReadPost", "BufNewFile" },
        opts = Util.lazy_opts(),
    },
}

return specs
