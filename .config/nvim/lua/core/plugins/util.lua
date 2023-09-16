---@type LazyPluginSpec[]
local specs = {
    {
        "echasnovski/mini.bufremove",
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
    },

    {
        's1n7ax/nvim-window-picker',
        event = 'VeryLazy',
        config = true,
    },
}

return specs
