---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {
    {
        "<leader>e",
        function()
            -- TODO: focus if not already focused, close if already focused
            require("neo-tree.command").execute({})
        end,
        desc = "Explorer NeoTree",
    },
}

return keymaps
