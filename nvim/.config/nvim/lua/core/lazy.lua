-------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-------------------------------------------------------------------------------
-- Install and configure plugins
-------------------------------------------------------------------------------

require("lazy").setup({
    spec = {
        { import = "core.plugins" },
        { import = "lsp.plugins" },
        { import = "ui.plugins" },
    },
    defaults = {
        -- Don't lazy load plugins, unless specified othervise
        lazy = false,
        -- Always use the latest git commit
        version = false,
    },
    install = {
        -- Install missing plugins on startup
        missing = true,
        -- Try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "material" },
    },

    checker = {
        -- Automatically check for updates
        enabled = true,
        -- Don't notify when new updates are found
        notify = false,
        -- Check for updates every day
        frequency = 86400,
    },

    performance = {
        rtp = {
            -- Disable internal plugins to improve performance
            -- TODO: disable more plugins
            disabled_plugins = {
--                "2html_plugin",
--                "tohtml",
--                "getscript",
--                "getscriptPlugin",
--                "gzip",
--                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
--                "matchit",
--                "tar",
--                "tarPlugin",
--                "rrhelper",
--                "spellfile_plugin",
--                "vimball",
--                "vimballPlugin",
--                "zip",
--                "zipPlugin",
                "tutor",
--                "rplugin",
--                "syntax",
--                "synmenu",
--                "optwin",
--                "compiler",
--                "bugreport",
--                "ftplugin",
            },
        },
    },
})
