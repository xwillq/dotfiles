---@type LazyPluginSpec
return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        -- 's1n7ax/nvim-window-picker',
    },
    cmd = 'Neotree',
    keys = {
        {
            '<leader>e',
            function()
                -- TODO: focus if not already focused, close if already focused
                require('neo-tree.command').execute({})
            end,
            desc = 'Explorer NeoTree',
        },
    },
    opts = {
        ---------------------------------------------------------------------------
        -- General
        ---------------------------------------------------------------------------

        sources = {
            'filesystem',
            'git_status',
            'document_symbols',
        },
        source_selector = {
            winbar = true,
            sources = {
                { source = 'filesystem' },
                { source = 'git_status' },
                { source = 'document_symbols' },
            },
        },
        enable_diagnostics = true,
        enable_git_status = true,
        enable_modified_markers = true,
        enable_opened_markers = true,
        enable_refresh_on_write = true,
        use_popups_for_input = false, -- If false, inputs will use vim.ui.input() instead of custom floats.
        use_default_mappings = false,
        hide_root_node = false,
        retain_hidden_root_indent = true,
        close_if_last_window = true,

        ---------------------------------------------------------------------------
        -- Window and source configs
        ---------------------------------------------------------------------------

        window = {
            width = 30,
            mappings = {
                -- Navigation and open
                ['h'] = 'collapse_or_focus_parent',
                ['<Left>'] = 'collapse_or_focus_parent',
                ['l'] = 'expand_or_focus_next',
                ['<Right>'] = 'expand_or_focus_next',
                ['<2-LeftMouse>'] = 'open',
                ['<CR>'] = 'open',
                ['w'] = 'open_with_window_picker',
                ['S'] = 'open_split',
                ['s'] = 'open_vsplit',
                ['t'] = 'open_tabnew',

                -- File actions
                ['a'] = { 'add', config = { show_path = 'relative' } },
                ['A'] = { 'add_directory', config = { show_path = 'relative' } },
                ['d'] = 'delete',
                ['r'] = 'rename',
                ['y'] = 'copy_to_clipboard',
                ['x'] = 'cut_to_clipboard',
                ['p'] = 'paste_from_clipboard',
                ['c'] = { 'copy', config = { show_path = 'relative' } },
                ['m'] = { 'move', config = { show_path = 'relative' } },

                -- Preview
                ['P'] = { 'toggle_preview', config = { use_float = false } },
                ['<Esc>'] = 'cancel', -- close preview or floating neo-tree window

                -- Other
                ['z'] = 'close_all_nodes',
                ['Z'] = 'expand_all_nodes',
                ['R'] = 'refresh',
                ['q'] = 'close_window',
                ['?'] = 'show_help',
                ['<'] = 'prev_source',
                ['>'] = 'next_source',
            },
        },

        filesystem = {
            -- Change vim cwd when changing cwd in neo-tree and vice-versa
            bind_to_cwd = true,
            use_libuv_file_watcher = true,
            scan_mode = 'deep',
            -- This will find and focus the file in the active buffer every time
            -- the current file is changed while the tree is open.
            follow_current_file = {
                enabled = false,
            },
            filtered_items = {
                -- Show hidden files when root is otherwise empty
                force_visible_in_empty_folder = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,

                -- Hide this files
                hide_by_name = {},
                -- Same as previous, but using glob patterns
                hide_by_pattern = {
                    '*.zwc',
                },
                -- Exclude files from hide_by_name and hide_by_pattern
                always_show = {},
                -- Don't show this files even when hidden files are shown
                never_show = {
                    '.DS_Store',
                    '.git',
                    '.idea',
                },
                -- Same as previous, but using glob patterns
                never_show_by_pattern = {},
            },
            window = {
                mappings = {
                    ['H'] = 'toggle_hidden',
                    ['[g'] = 'prev_git_modified',
                    [']g'] = 'next_git_modified',
                    ['/'] = 'fuzzy_finder',
                    ['D'] = 'fuzzy_finder_directory',
                    ['f'] = 'filter_as_you_type',
                    ['<C-x>'] = 'clear_filter',
                    ['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
                    ['.'] = 'set_root',
                },
            },
        },

        document_symbols = {
            window = {
                mappings = {
                    ['<cr>'] = 'jump_to_symbol',
                    ['o'] = 'jump_to_symbol',
                    ['A'] = 'noop',
                    ['d'] = 'noop',
                    ['y'] = 'noop',
                    ['x'] = 'noop',
                    ['p'] = 'noop',
                    ['c'] = 'noop',
                    ['m'] = 'noop',
                    ['a'] = 'noop',
                    ['/'] = 'filter',
                    ['f'] = 'filter_on_submit',
                },
            },
            renderers = {
                root = {
                    { 'indent' },
                    { 'icon', default = 'C' },
                    { 'name', zindex = 10 },
                },
                symbol = {
                    { 'indent', with_expanders = true },
                    { 'kind_icon', default = '?' },
                    {
                        'container',
                        content = {
                            { 'name', zindex = 10 },
                            -- {'kind_name', zindex = 20, align = 'right'},
                        },
                    },
                },
            },
        },

        ---------------------------------------------------------------------------
        -- Commands
        ---------------------------------------------------------------------------

        commands = {
            collapse_or_focus_parent = function(state)
                local node = state.tree:get_node()

                local is_expanded = node:has_children() and node:is_expanded()
                -- `directory` is a special case for filesystem source,
                -- since they can exist and be expanded while being empty
                or node.type == 'directory' and node.empty_expanded

                if is_expanded then
                    state.commands.toggle_node(state)
                else
                    require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                end
            end,
            open_or_focus_child = function(state)
                local node = state.tree:get_node()
                if node:has_children() and node:is_expanded() then
                    require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                else
                    state.commands.open(state)
                end
            end,
            expand_or_focus_next = function(state)
                local node = state.tree:get_node()

                -- `directory` is a special case for filesystem source,
                -- since they can exist and be expanded without having
                -- any children
                local is_expandable = node:has_children() or node.type == 'directory'

                if not is_expandable then
                    require('neo-tree.ui.renderer').focus_node(state, nil, nil, 1)
                    return
                end

                -- `empty_expanded` is a special case for filesystem source,
                -- since empty directories can be displayed as expanded
                -- without actually being in this state
                local is_expanded = node:is_expanded() or node.empty_expanded

                if not is_expanded then
                    state.commands.toggle_node(state)
                else
                    require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                end
            end,
        },

        ---------------------------------------------------------------------------
        -- UI
        ---------------------------------------------------------------------------

        default_component_configs = {
            indent = {
                with_expanders = true,
            },
            -- icon = {
            --     folder_closed = icons.filesystem.closed_dir,
            --     folder_open = icons.filesystem.opened_dir,
            --     folder_empty = icons.filesystem.closed_empty_dir,
            --     folder_empty_open = icons.filesystem.opened_empty_dir,
            -- },
            -- git_status = {
            --     symbols = {
            --         -- Change type
            --         added = icons.git.text.added,
            --         deleted = icons.git.text.removed,
            --         modified = icons.git.text.modified,
            --         renamed = icons.git.file.renamed,
            --         -- Status type
            --         untracked = icons.git.file.untracked,
            --         ignored = icons.git.file.ignored,
            --         unstaged = icons.git.file.unstaged,
            --         staged = icons.git.file.staged,
            --         conflict = icons.git.file.conflict,
            --     },
            -- },
        },

        renderers = {
            directory = {
                { 'indent' },
                { 'icon' },
                { 'current_filter' },
                {
                    'container',
                    content = {
                        { 'name', zindex = 10 },
                        { 'clipboard', zindex = 10 },
                        { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
                        { 'git_status', zindex = 20, align = 'right', hide_when_expanded = true },
                    },
                },
            },
            file = {
                { 'indent' },
                { 'icon' },
                {
                    'container',
                    content = {
                        {
                            'name',
                            zindex = 10,
                        },
                        { 'clipboard', zindex = 10 },
                        { 'bufnr', zindex = 10 },
                        { 'modified', zindex = 20, align = 'right' },
                        { 'diagnostics', zindex = 20, align = 'right' },
                        { 'git_status', zindex = 20, align = 'right' },
                    },
                },
            },
            message = {
                { 'indent', with_markers = false },
                { 'name', highlight = 'NeoTreeMessage' },
            },
            terminal = {
                { 'indent' },
                { 'icon' },
                { 'name' },
                { 'bufnr' },
            },
        },
    },
}
