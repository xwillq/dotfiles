local opt = vim.opt_local

local textwidth = opt.textwidth:get()

if textwidth > 50 then
    opt.colorcolumn = { 50, textwidth }
else
    opt.colorcolumn = { textwidth }
end

vim.b.undo_ftplugin = vim.b.undo_ftplugin .. '|setl colorcolumn<'
