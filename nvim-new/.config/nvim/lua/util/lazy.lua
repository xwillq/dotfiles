---@alias OptsCallback fun(self: LazyPlugin, opts: table):table?
---@alias KeysCallback fun(self: LazyPlugin, keys: string[]):(string|LazyKeys)[]

local LazyUtil = require('lazy.core.util')

local M = {}

setmetatable(M, {
    __index = function(_, key)
        if LazyUtil[key] then
            return LazyUtil[key]
        end
    end
})

---Get plugin
---@param name string
---@return LazyPlugin|nil
function M.get_plugin(name)
    return require('lazy.core.config').plugins[name]
end

---Check if plugin exists
---@param name string
---@return boolean
function M.has_plugin(name)
    return M.get_plugin(name) ~= nil
end

---Check if plugin exists and is loaded
---@param name string
---@return boolean
function M.is_loaded(name)
    local plugin = M.get_plugin(name)
    return plugin ~= nil and plugin._.loaded ~= nil
end

---Call function on plugin load
---@param name string
---@param fn fun(name:string)
function M.on_load(name, fn)
    if M.is_loaded(name) then
        fn(name)
    else
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyLoad',
            callback = function(event)
                if event.data == name then
                    fn(name)
                    return true
                end
            end,
        })
    end
end

---Normalize plugin name
---@param name string
---@return string
function M.normalize_name(name)
    local normalized, _ = name:lower():gsub('^n?vim%-', ''):gsub('%.n?vim$', ''):gsub('%.lua', ''):gsub('%.', '-')
    return normalized
end

---Get module that called current function
---@return string|nil
local function get_caller_module()
    local info = debug.getinfo(3)
    if info == nil then
        return nil
    end

    local caller_path = info['short_src']

    local module = nil
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        if caller_path:find(path, 1, true) == 1 then
            module, _ = caller_path
                :gsub(string.format('^%s/lua/', path):gsub('%-', '%%-'), '')
                :gsub('%.lua$', '')
                :gsub('/', '.')
            break
        end
    end

    return module
end

---Build callback for opts and keys in lazy plugin spec
---@param module string Location of plugin config/keymaps
---@return OptsCallback|KeysCallback
local function lazy_callback(module)
    return function(plugin, prev)
        module = module .. '.' .. M.normalize_name(plugin.name)
        local success, new_values = pcall(require, module)
        if success then
            return vim.tbl_deep_extend('force', prev, new_values)
        else
            vim.notify(string.format("Couldn't load module %s", module), vim.log.levels.WARN)
            return prev
        end
    end
end

---Build callback for opts in lazy plugin spec
---@return OptsCallback
function M.lazy_opts()
    local caller = get_caller_module()
    local module = caller:gsub('plugins', 'configs')
    return lazy_callback(module) --[[@as OptsCallback]]
end

---Build callback for keys in lazy plugin spec
---@return KeysCallback
function M.lazy_keys()
    local caller = get_caller_module()
    local module = caller:gsub('plugins', 'keymaps')
    return lazy_callback(module) --[[@as KeysCallback]]
end

return M
