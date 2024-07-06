---@module 'nvim-treesitter'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts_extend = { 'ensure_installed' },
    ---@type TSConfig
    opts = {
        ensure_installed = {
            'git_config',
            'git_rebase',
            'gitcommit',
            'gitignore',
            'diff',
        },
    },
}
