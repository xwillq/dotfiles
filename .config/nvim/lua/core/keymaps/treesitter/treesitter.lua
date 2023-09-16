local ts_config_keymaps = require("core.configs.treesitter.treesitter").incremental_selection.keymaps

---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {}

if ts_config_keymaps.init_selection then
    table.insert(keymaps, {
        ts_config_keymaps.init_selection,
        mode = "n",
        desc = "Start incremental selection",
    })
end
if ts_config_keymaps.node_incremental then
    table.insert(keymaps, {
        ts_config_keymaps.node_incremental,
        mode = "x",
        desc = "Increment selection",
    })
end
if ts_config_keymaps.scope_incremental then
    table.insert(keymaps, {
        ts_config_keymaps.scope_incremental,
        mode = "x",
        desc = "Increment scope selection",
    })
end
if ts_config_keymaps.node_decremental then
    table.insert(keymaps, {
        ts_config_keymaps.node_decremental,
        mode = "x",
        desc = "Decrement selection",
    })
end

return keymaps
