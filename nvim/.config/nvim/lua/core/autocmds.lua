local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local group = aug('core', {})

local function set_modifiable_options(buf)
    local bo = vim.bo[buf]
    for _, win in pairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
            local wo = vim.wo[win][buf]
            if bo.modifiable then
                wo.colorcolumn = vim.go.colorcolumn
                wo.spell = vim.go.spell
            else
                wo.colorcolumn = ''
                wo.spell = false
            end
        end
    end
end

au('BufWinEnter', {
    group = group,
    desc = 'Set up options depending on modifiable option',
    callback = function(event)
        set_modifiable_options(event.buf)
    end,
})

au('OptionSet', {
    group = group,
    desc = 'Set up options when changing modifiable option',
    pattern = 'modifiable',
    callback = function(event)
        set_modifiable_options(vim.api.nvim_get_current_buf())
    end,
})

au('FileType', {
    group = group,
    desc = 'Close some filetypes with <q>',
    pattern = {
        'help',
        'qf', -- QuickFix window
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})

au('FileType', {
    group = group,
    desc = 'Set foldexpr to treesitter for supported languages',
    callback = function(event)
        local ts_parsers = require('nvim-treesitter.parsers')
        local function setFoldmethod(win, buf)
            local opt = vim.wo[win][buf]
            local lang = vim.treesitter.language.get_lang(event.match)

            -- NOTE: internal API
            if lang and ts_parsers.has_parser(lang) then
                opt.foldmethod = 'expr'
                opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            else
                opt.foldmethod = vim.go.foldmethod
                opt.foldexpr = vim.go.foldexpr
            end
        end

        for _, win in pairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == event.buf then
                setFoldmethod(win, event.buf)
            end
        end
    end,
})
