vim.opt_local.commentstring = '-- %s'

vim.b.undo_ftplugin = vim.b.undo_ftplugin .. '|setl commentstring<'
