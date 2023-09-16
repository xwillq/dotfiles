vim.cmd("source " .. vim.env.XDG_CONFIG_HOME .. "/nvim/share/options.vim")

vim.g.editorconfig = false

local opt = vim.opt


--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------

-- Don't show mode since it will be shown in lualine
opt.showmode = false

-- Don't show amount of search results in bottom right corner
opt.shortmess:append({ S = true })

-- Disable line wrap
opt.wrap = false

-- Always show sign column, so editor window doesn't jump when signs disappear
opt.signcolumn = "yes"

-- Add visual guide on column 120
opt.colorcolumn = "80,120"

-- Highlight line with cursor
opt.cursorline = true

-- Enable 24-bit colors in terminal
opt.termguicolors = true

-- Max amount of items in completion menu
opt.pumheight = 10


--------------------------------------------------------------------------------
-- UX
--------------------------------------------------------------------------------

-- Turn on mouse support
opt.mouse = "a"

-- Open split windows below or to the right of current window
opt.splitbelow = true
opt.splitright = true


--------------------------------------------------------------------------------
-- Indentation
--------------------------------------------------------------------------------

-- Copy indent from current line to new line
opt.autoindent = true
-- Smart autoindenting on new lines
opt.smartindent = true
-- Indent wrapped lines
opt.breakindent = true
-- Round indent to multiple of 'shiftwidth'
opt.shiftround = true

-- Expand tab character into spaces
opt.expandtab = true
-- Number of spaces tab character equals to
opt.tabstop = 4
-- Number of spaces tab equals to when editing, 0 means this feature is disabled, so
-- value of `tabstop` will be used
opt.softtabstop = 0
-- Number of spaces to use when shifting with << and >>, 0 means equal to `tabstop`
opt.shiftwidth = 0


--------------------------------------------------------------------------------
-- Folding
--------------------------------------------------------------------------------

-- Use tree sitter for folding (doesn't work well, so disabled)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Don't fold anything by default
opt.foldlevel = 999

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------

-- Highlight search results
opt.hlsearch = true

--------------------------------------------------------------------------------
-- Spell checking
--------------------------------------------------------------------------------

opt.spell = true
-- NOTE: requires netrw enabled to download missing languages
opt.spelllang = { "tech", "en_us", "ru_ru" }
opt.spelloptions = "camel"


--------------------------------------------------------------------------------
-- Language plugins
--------------------------------------------------------------------------------

-- Disable default yaml indentation config
-- vim.g.yaml_recommended_style = 0
