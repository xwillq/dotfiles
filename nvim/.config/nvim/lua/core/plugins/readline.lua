---@type LazyPluginSpec
return {
    'assistcontrol/readline.nvim',
    lazy = false,
    config = function()
        local map = vim.keymap.set
        local readline = require('readline')

        map('!', '<C-a>', readline.beginning_of_line)
        map('!', '<C-e>', readline.end_of_line)
        map('!', '<M-f>', readline.forward_word)
        map('!', '<M-b>', readline.backward_word)
        map('!', '<C-k>', readline.kill_line)
        map('!', '<C-u>', readline.backward_kill_line) -- Preserve default keymap for insert?
        map('!', '<M-d>', readline.kill_word)
        map('!', '<M-BS>', readline.backward_kill_word)

        map('!', '<C-x><C-a>', '<C-a>')
    end,
}
