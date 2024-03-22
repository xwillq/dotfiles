---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {
    { "<leader>cm", require("mason.api.command").Mason, desc = "Mason" },
}

return keymaps
