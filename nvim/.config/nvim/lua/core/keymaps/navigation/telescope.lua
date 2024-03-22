local Util = require("util")

---@diagnostic disable:missing-fields
---@type LazyKeys[]
local keymaps = {
    -- Find files
    { "<leader>fb", Util.telescope("buffers", { sort_mru = true, show_all_buffers = true }), desc = "Buffers" },
    { "<leader>ff", Util.telescope("find_files"), desc = "Find Files" },
    { "<leader>fg", Util.telescope("git_files"), desc = "Find Files in Git" },
    { "<leader>fr", Util.telescope("oldfiles"), desc = "Recent" },

    -- Search
    { "<leader>sa", Util.telescope("autocommands"), desc = "Auto Commands" },
    { "<leader>sb", Util.telescope("current_buffer_fuzzy_find"), desc = "Buffer" },
    { "<leader>sc", Util.telescope("command_history"), desc = "Command History" },
    { "<leader>sC", Util.telescope("commands"), desc = "Commands" },
    { "<leader>sd", Util.telescope("diagnostics", { bufnr = 0 }), desc = "Document diagnostics" },
    { "<leader>sD", Util.telescope("diagnostics"), desc = "Workspace diagnostics" },
    { "<leader>sg", Util.telescope("live_grep"), desc = "Grep" },
    { "<leader>sh", Util.telescope("help_tags"), desc = "Help Pages" },
    { "<leader>sH", Util.telescope("highlights"), desc = "Search Highlight Groups" },
    { "<leader>sk", Util.telescope("keymaps"), desc = "Key Maps" },
    { "<leader>sM", Util.telescope("man_pages"), desc = "Man Pages" },
    { "<leader>sm", Util.telescope("marks"), desc = "Jump to Mark" },
    { "<leader>so", Util.telescope("vim_options"), desc = "Options" },
    { "<leader>sR", Util.telescope("resume"), desc = "Resume" },
    { "<leader>sw", Util.telescope("grep_string"), desc = "Word" },
    {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
            symbols = {
                "Class",
                "Function",
                "Method",
                "Constructor",
                "Interface",
                "Module",
                "Struct",
                "Trait",
                "Field",
                "Property",
            },
        }),
        desc = "Goto Symbol",
    },
    {
        "<leader>sS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
            symbols = {
                "Class",
                "Function",
                "Method",
                "Constructor",
                "Interface",
                "Module",
                "Struct",
                "Trait",
                "Field",
                "Property",
            },
        }),
        desc = "Goto Symbol (Workspace)",
    },

    -- Shortcuts
    { "<leader>,", "<leader>fb", desc = "Switch Buffer", remap = true },
    { "<leader>/", "<leader>sg", desc = "Grep", remap = true },
    { "<leader>:", "<leader>sc", desc = "Command History", remap = true },
    { "<leader><space>", "<leader>ff", desc = "Find Files", remap = true },
}

return keymaps
