---@type LazyPluginSpec
return {
    'kristijanhusak/vim-dadbod-completion',
    dependencies = {
        { 'tpope/vim-dadbod' },
    },
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('vim-dadbod-completion', {}),
            desc = 'Configure omnifunc to use vim-dadbod-completion',
            pattern = 'sql',
            callback = function(event)
                vim.bo[event.buf].omnifunc = 'vim_dadbod_completion#omni'
            end,
        })
    end,
}
