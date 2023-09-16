local lsp_util = require("lspconfig.util")

return {
    root_dir = lsp_util.root_pattern("lua", ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
    settings = {
        Lua = {
            completion = {
                -- Trigger used for postfix suggestions
                postfix = ".",
                showWord = "Disable",
                workspaceWord = false,
            },
            -- TODO: configure hints
            hint = {
                -- Use inline hints
                enable = true,
            },
            workspace = {
                --library = libraries,
                -- Don't check for 3rd party libraries automatically
                checkThirdParty = false,
                -- List of directories excluded from analysis
                ignoreDir = { ".git", ".idea" },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
