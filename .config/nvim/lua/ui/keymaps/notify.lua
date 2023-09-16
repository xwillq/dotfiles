---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {
    {
        "<leader>un",
        function()
            require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
    },
}

return keymaps
