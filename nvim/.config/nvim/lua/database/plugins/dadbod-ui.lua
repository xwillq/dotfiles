---@type LazyPluginSpec
return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod' },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    keys = {
        {
            '<leader>rs',
            '<Plug>(DBUI_ExecuteQuery)',
            mode = { 'n', 'x' },
            desc = 'Run selected sql query',
            ft = 'sql',
        },
    },
    init = function()
        vim.g.db_ui_execute_on_save = 0
        vim.g.db_ui_auto_execute_table_helpers = 1

        vim.g.db_ui_bind_param_pattern = '\\$\\d\\+'

        vim.g.db_ui_win_position = 'right'

        vim.g.db_ui_hide_schemas = { 'information_schema', 'pg_catalog', 'pg_toast' }

        vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/db_ui'

        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1
    end,
}
