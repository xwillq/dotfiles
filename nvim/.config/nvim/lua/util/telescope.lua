local M = {}

---Get closure for running given picker
---@param picker string Name of builtin picker or `extension.picker`
---@param opts table?
---@return function()
function M.picker(picker, opts)
    opts = opts or {}

    local dot_position = picker:find('.', 1, true)
    local extension
    if dot_position then
        extension = picker:sub(1, dot_position - 1)
        picker = picker:sub(dot_position + 1, -1)
    end

    if extension then
        return function()
            require('telescope').extensions[extension][picker](opts)
        end
    else
        return function()
            require('telescope.builtin')[picker](opts)
        end
    end
end

return M
