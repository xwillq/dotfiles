local icons = require("ui.icons")

return {
    -- Global options
    options = {
        theme = "material",
        -- TODO: find good separators
        -- section_separators = '',
        -- component_separators = '',

        -- Don't allow left sections to take space of right sections,
        -- even if right sections don't display anything
        always_divide_middle = false,
        -- Use one statusline for all windows
        globalstatus = true,

        -- Don't show statusline for this filetypes
        disabled_filetypes = {
            statusline = { "dashboard", "alpha" }
            --"NvimTree",
            --"Trouble",
        },
    },

    sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, file_status = false },
            -- stylua: ignore
            {
                function() return require("nvim-navic").get_location() end,
                cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
        },
        lualine_x = {
            -- stylua: ignore
            {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            },
            -- stylua: ignore
            {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            },
            -- stylua: ignore
            {
                function() return "  " .. require("dap").status() end,
                cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates },
        },
        lualine_y = {
            {
                "diff",
                symbols = {
                    added = icons.git.text.added,
                    modified = icons.git.text.modified,
                    removed = icons.git.text.removed,
                },
                source = function()
                    local gs = vim.b.gitsigns_status_dict
                    if gs then
                        return {
                            added = gs.added,
                            modified = gs.changed,
                            removed = gs.removed
                        }
                    end
                end,
            },
            -- TODO: base branch on cwd
            "branch",
        },
        lualine_z = {
            "searchcount",
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        },
    },
    -- TODO: configure sections for inactive windows
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {
        "neo-tree",
        "trouble",
        "lazy",
    }
}
