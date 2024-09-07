local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local group = aug('formatting', {})

au('FileType', {
    group = group,
    desc = 'Set up formatexpr',
    callback = function(event)
        if vim.bo[event.buf].buftype ~= '' then
            return
        end

        local formatters = require('conform').list_formatters(event.buf)

        for _, formatter in pairs(formatters) do
            if formatter.available then
                vim.opt_local.formatexpr = 'v:lua.require("conform").formatexpr()'
                return
            end
        end

        vim.opt_local.formatexpr = nil
    end,
})
