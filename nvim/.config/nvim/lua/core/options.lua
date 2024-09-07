local opt = vim.opt

-- Don't show mode since it will be shown in lualine
-- opt.showmode = false

-- Don't show amount of search results in bottom right corner
-- opt.shortmess:append({ S = true })

-- Max amount of items in completion menu
opt.pumheight = 10


--------------------------------------------------------------------------------
-- UX
--------------------------------------------------------------------------------

-- Turn on mouse support
opt.mouse = 'a'

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

opt.tabstop = 8 -- Default width of tab in many editors
opt.expandtab = true -- Insert appropriate amount of spaces instead of tab
opt.shiftwidth = 4 -- Indentation size to use with <<, >> and 'cindent'
opt.softtabstop = -1 -- Number of spaces to use when inserting tab, -1 sets it to 'shiftwidth'

-- Expand tab character into spaces
-- opt.expandtab = true
-- Number of spaces tab character equals to
-- opt.tabstop = 4
-- Number of spaces tab equals to when editing, 0 means this feature is disabled, so
-- value of `tabstop` will be used
-- opt.softtabstop = 0
-- Number of spaces to use when shifting with << and >>, 0 means equal to `tabstop`
-- opt.shiftwidth = 0


--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------

-- Highlight search results
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true


--------------------------------------------------------------------------------
-- Language plugins
--------------------------------------------------------------------------------

-- Disable default yaml indentation config
vim.g.yaml_recommended_style = 0


opt.laststatus = 3

opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers

opt.scrolloff = 3 -- Context lines around the cursor
opt.sidescrolloff = 10 -- Context columns around the cursor

opt.wrap = false -- Wrap long lines

-- Always show sign column, so editor window doesn't jump when signs disappear
opt.signcolumn = 'yes'

opt.colorcolumn = { 80, 120 } -- Visual guides

opt.cursorline = true -- Highlight line with cursor

opt.backspace:append('nostop') -- Allow ctlr-w and ctrl-u to delete whole lines

--------------------------------------------------------------------------------
-- Folding
--------------------------------------------------------------------------------

-- Use indent for folding by default. When treesitter is available for current
-- file, it is used instead.
opt.foldmethod = 'indent'

opt.foldlevel = 999 -- Don't fold anything by default

--------------------------------------------------------------------------------
-- Spell checking
--------------------------------------------------------------------------------

opt.spell = true
opt.spelllang = { 'en_us', 'ru_ru' }
opt.spelloptions = 'camel'
