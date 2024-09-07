local function delete_buffer(force)
    return function ()
        return require('mini.bufremove').delete(nil, force)
    end
end

---@type LazyPluginSpec
return {
    -- TODO: set up mappings or commands
    'echasnovski/mini.bufremove',
    keys = {
        { '<leader>bd', delete_buffer(false), desc = 'Close buffer' },
        { '<leader>bD', delete_buffer(true), desc = 'Close buffer (force)' },
    },
    config = true,
}
