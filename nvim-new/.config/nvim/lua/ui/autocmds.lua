local group = vim.api.nvim_create_augroup('ui', {})

vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
    group = group,
    desc = 'Set cursor style when entering or unsuspending vim',
    callback = function()
        vim.opt.guicursor = {
            'n-r-cr-v-o:block',
            'i-c-ci:ver5',
            'a:blinkwait400-blinkon900-blinkoff400',
        }
    end,
})

vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
    group = group,
    desc = 'Reset cursor style to default when exiting or suspending vim',
    callback = function()
        vim.opt.guicursor = {}
        -- Without this, cursor won't change on `:wq`
        vim.api.nvim_chan_send(vim.v.stderr, '\x1b[ q')
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    desc = 'Highlight yanked text',
    callback = function()
        vim.highlight.on_yank()
    end,
})
