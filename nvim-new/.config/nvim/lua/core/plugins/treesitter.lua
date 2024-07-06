---@module 'nvim-treesitter'
---@diagnostic disable: missing-fields

---@type LazyPluginSpec
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
    cmd = {
        'TSInstall',
        'TSInstallSync',
        'TSInstallInfo',
        'TSUpdate',
        'TSUpdateSync',
        'TSUninstall',
        'TSBufEnable',
        'TSBufDisable',
        'TSBufToggle',
        'TSEnable',
        'TSDisable',
        'TSToggle',
        'TSModuleInfo',
        'TSEditQuery',
        'TSEditQueryUserAfter',
    },
    ---@type TSConfig
    opts = {
        -- A list of parsers that must always be installed
        ensure_installed = {
            -- Vim
            'vim',
            'vimdoc',
            'lua',
            'luadoc',
            'luap',

            -- General files
            'json',
            'json5',
            'yaml',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = false,

        highlight = {
            enable = true,
            -- Disable default Neovim syntax highlighting
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
        },
    },
}
