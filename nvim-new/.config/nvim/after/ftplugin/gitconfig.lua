local opt = vim.opt_local

opt.expandtab = false

vim.b.undo_ftplugin = vim.b.undo_ftplugin .. '|setl expandtab<'
