local Util = require("util")

---@type LazyPluginSpec[]
local specs = {
    -- LSP configuration helper
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
        keys = Util.lazy_keys(),
        config = function(_, opts)
            -- Get servers to configure
            local servers = {}

            local installed_servers = require("mason-lspconfig").get_installed_servers()
            for _, server_name in pairs(installed_servers) do
                servers[server_name] = true
            end

            local lazy_utils = require("lazy.core.util")
            lazy_utils.lsmod("lsp.servers", function(modname)
                local server_name, _ = modname:gsub(".*%.", "")
                servers[server_name] = true
            end)

            -- Set up servers
            local function add_capabilities(capabilities)
                return vim.tbl_deep_extend(
                    "force",
                    vim.lsp.protocol.make_client_capabilities(),
                    require("cmp_nvim_lsp").default_capabilities(),
                    capabilities or {}
                )
            end

            for server_name, _ in pairs(servers) do
                local sucess, config = pcall(require, "lsp.servers." .. server_name)
                if not sucess then
                    config = {}
                end
                config.capabilities = add_capabilities(config.capabilities)
                require("lspconfig")[server_name].setup(config)
            end

            -- Set up keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buffer = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require("lsp.keymaps").on_attach(client, buffer)
                end,
            })
        end,
    },

    -- Package manager for LSPs, linters, formatters and DAPs
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonInstallAll",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
        keys = Util.lazy_keys(),
        config = true,
    },

    -- Bridge between mason and lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = Util.lazy_opts(),
    },

    -- LSP setup for nvim configs
    {
        "folke/neodev.nvim",
        lazy = true,
        opts = Util.lazy_opts(),
    },
}

return specs
