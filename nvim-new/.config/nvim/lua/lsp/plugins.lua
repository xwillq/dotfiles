local Util = require('util.lazy')

---@type LazyPluginSpec[]
return {
    -- LSP configuration helper
    {
        "neovim/nvim-lspconfig",
        config = function(_, opts)
            -- Servers to configure
            local servers = {}

            local lazy_utils = require('lazy.core.util')
            lazy_utils.lsmod('lsp.servers', function(modname)
                local server_name, _ = modname:gsub('.*%.', '')
                table.insert(servers, server_name)
            end)

            for _, server_name in pairs(servers) do
                local ok, config = pcall(require, 'lsp.servers.' .. server_name)
                if not ok then
                    -- TODO: handle error
                end
                require('lspconfig')[server_name].setup(config)
            end
        end,
    },

    {
        'folke/lazydev.nvim',
        opts = {
            library = {
                { 'lazy.nvim', words = { 'lazy' } },
            },
        },
    },
}
