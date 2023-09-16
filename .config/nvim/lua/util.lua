local M = {}

---Get a function that calls telescope.
function M.telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts }
    return function()
        builtin = params.builtin
        opts = params.opts or {}
        if opts.cwd and opts.cwd ~= vim.loop.cwd() then
            opts.attach_mappings = function(_, map)
                map("i", "<a-c>", function()
                    local action_state = require("telescope.actions.state")
                    local line = action_state.get_current_line()
                    M.telescope(
                        params.builtin,
                        vim.tbl_deep_extend("force", {}, params.opts or {}, { cwd = false, default_text = line })
                    )()
                end)
                return true
            end
        end

        require("telescope.builtin")[builtin](opts)
    end
end

---@param plugin string
function M.has(plugin)
    return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

-- delay notifications till vim.notify was replaced or after 500ms
function M.lazy_notify()
    local notifs = {}
    local function temp(...)
        table.insert(notifs, vim.F.pack_len(...))
    end

    local orig = vim.notify
    vim.notify = temp

    local timer = vim.loop.new_timer()
    local check = vim.loop.new_check()

    local replay = function()
        timer:stop()
        check:stop()
        if vim.notify == temp then
            vim.notify = orig -- put back the original notify if needed
        end
        vim.schedule(function()
            ---@diagnostic disable-next-line: no-unknown
            for _, notif in ipairs(notifs) do
                vim.notify(vim.F.unpack_len(notif))
            end
        end)
    end

    -- wait till vim.notify has been replaced
    check:start(function()
        if vim.notify ~= temp then
            replay()
        end
    end)
    -- or if it took more than 500ms, then something went wrong
    timer:start(500, 0, replay)
end

---Normalize plugin name
---@param name string
---@return string
function M.normname(name)
    local ret = name:lower():gsub("^n?vim%-", ""):gsub("%.n?vim$", ""):gsub("%.lua", ""):gsub("%.", "-")
    return ret
end

---@alias OptsCallback fun(self: LazyPlugin, opts: table):table?
---@alias KeysCallback fun(self: LazyPlugin, keys: string[]):(string|LazyKeys)[]

---Build callback for opts and keys in lazy plugin spec
---@param module string Location of plugin config/keymaps
---@return OptsCallback|KeysCallback
local function lazy_callback(module)
    return function(plugin, prev)
        module = module .. "." .. M.normname(plugin.name)
        local success, new_values = pcall(require, module)
        if success then
            return vim.tbl_deep_extend("force", prev, new_values)
        else
            vim.notify(
                string.format("Couldn't load module %s", module),
                vim.log.levels.WARN
            )
            return prev
        end
    end
end

---Get module, that called current function
---@return string
local function get_caller_module()
    local nvim_config_path = vim.fn.environ()["MYVIMRC"]:gsub("init%.lua$", "")
    local relative_caller_path = debug.getinfo(3, "S")["short_src"]:gsub(nvim_config_path, "")

    return relative_caller_path:gsub("lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
end

---Build callback for opts in lazy plugin spec
---@return OptsCallback
function M.lazy_opts()
    local caller = get_caller_module()
    local module = caller:gsub("plugins", "configs")
    return lazy_callback(module) --[[@as OptsCallback]]
end

---Build callback for keys in lazy plugin spec
---@return KeysCallback
function M.lazy_keys()
    local caller = get_caller_module()
    local module = caller:gsub("plugins", "keymaps")
    return lazy_callback(module) --[[@as KeysCallback]]
end

---Call callback after specified time
---@param ms integer Milliseconds before calling callback
---@param callback fun()
function M.debounce(ms, callback)
    local timer = vim.loop.new_timer()
    timer:stop()
    timer:start(ms, 0, vim.schedule_wrap(callback))
end

return M
