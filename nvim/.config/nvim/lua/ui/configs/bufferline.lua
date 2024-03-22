local icons = require("ui.icons")


---@diagnostic disable:missing-fields
---@type bufferline.UserConfig
local config = {
    options = {
        always_show_bufferline = true,
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,

        left_trunc_marker = "⇠",
        right_trunc_marker = "⇢",
        modified_icon = icons.git.file.modified,
        separator_style = "thick",
        --indicator = { icon = vim.opt.fillchars:get()["vert"] or "│" }, -- Match icon to window separators

        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,

        offsets = {
            {
                filetype = "neo-tree",
                -- text = function()
                --     return icons.filesystem.opened_dir .. vim.fn.getcwd():gsub(".*/", "")
                -- end,
                text = "NeoTree",
                text_align = "left",
                highlight = "Directory",
                separator = true,
            },
        },
    },
}

return config
