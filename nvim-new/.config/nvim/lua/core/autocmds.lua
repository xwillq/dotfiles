local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local group = aug('core', {})

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
    desc = 'Disable editor options for some filetypes',
    pattern = {
        'help',
        'qf',
    },
    callback = function()
        vim.opt_local.colorcolumn = {}
        vim.opt_local.spell = false
    end,
})

au('FileType', {
    group = group,
    desc = 'Set foldexpr to treesitter for supported languages',
    callback = function(event)
        local function setFoldmethod(win, buf)
            local opt = vim.wo[win][buf]
            local lang = vim.treesitter.language.get_lang(event.match)

            -- NOTE: internal API
            if lang and vim._ts_has_language(lang) then
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
