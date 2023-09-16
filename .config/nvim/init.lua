-- Defer notifications untill vim.notify was replaced or after 500ms
require("util").lazy_notify()

-- Set up options
require("core.options")

-- Set up plugins
require("core.lazy")
vim.cmd.colorscheme("material")

-- Set up keymaps and autocommands
require("core.keymaps")
require("core.autocmds")
