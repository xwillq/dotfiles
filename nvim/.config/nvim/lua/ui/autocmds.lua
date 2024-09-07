local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local group = aug('ui', {})

au({ 'VimEnter', 'VimResume' }, {
    group = group,
    desc = 'Set cursor style when entering or unsuspending vim',
    callback = function()
        vim.opt.guicursor = {
            'n-v-o:block',
            'i-c-ci:ver5',
            'r-cr:hor5',
            'a:Cursor/Cursor-blinkwait400-blinkon900-blinkoff400',
        }
    end,
})

au({ 'VimLeave', 'VimSuspend' }, {
    group = group,
    desc = 'Reset cursor style to default when exiting or suspending vim',
    callback = function()
        vim.opt.guicursor = {}
        -- Without this, cursor won't change on `:wq`
        vim.api.nvim_chan_send(vim.v.stderr, '\x1b[ q')
    end,
})

au('TextYankPost', {
    group = group,
    desc = 'Highlight yanked text',
    callback = function()
        vim.highlight.on_yank()
    end,
})
