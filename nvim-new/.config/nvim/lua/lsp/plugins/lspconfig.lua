---@type LazyPluginSpec
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        -- Servers to configure
        local servers = {}

        local Util = require('util').lazy
        Util.lsmod('lsp.servers', function(modname)
            local server_name, _ = modname:gsub('.*%.', '')
            table.insert(servers, server_name)
        end)

        for _, server_name in pairs(servers) do
            local ok, config = pcall(require, 'lsp.servers.' .. server_name)
            if not ok then
                -- TODO: handle error
            end
            -- Allow adding servers without configuration
            if type(config) == 'boolean' then
                config = {}
            end
            require('lspconfig')[server_name].setup(config)
        end
    end,
}
