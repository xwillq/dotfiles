---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {
    { "<leader>cl", require("lspconfig.ui.lspinfo"), desc = "Lsp Info" },
}

return keymaps
