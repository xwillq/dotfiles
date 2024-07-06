---@module 'gitsigns'
---@diagnostic disable: missing-fields

local function set_keymaps(buffer)
    local gs = require('gitsigns')

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = buffer
        vim.keymap.set(mode, l, r, opts)
    end

    map('n', '[c', function()
        if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
        else
            gs.nav_hunk('prev')
        end
    end, { desc = 'Prev change' })
    map('n', ']c', function()
        if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
        else
            gs.nav_hunk('next')
        end
    end, { desc = 'Next change' })

    map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<leader>ghs', function()
        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Stage hunk' })
    map('v', '<leader>ghr', function()
        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Reset hunk' })

    map('n', '<leader>ghS', gs.stage_buffer, { desc = 'Stage buffer' })
    map('n', '<leader>ghR', gs.reset_buffer, { desc = 'Reset buffer' })
    map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })

    map('n', '<leader>ghp', gs.preview_hunk_inline, { desc = 'Preview hunk inline' })
    map('n', '<leader>ghP', gs.preview_hunk, { desc = 'Preview hunk' })

    require('util').lazy.on_load('which-key.nvim', function()
        require('which-key').add(
            {
                { '<leader>g', group = 'Git' },
                { '<leader>gh', group = 'Hunks' }
            }
        )
    end)

    -- New LazyNvim
    -- map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
    -- map('n', '<leader>ghd', gs.diffthis, 'Diff This')
    -- map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
    -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')

    -- New gitsigns
    -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    -- map('n', '<leader>hd', gitsigns.diffthis)
    -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    -- map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Old
    -- map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
    -- map('n', '<leader>ghd', gs.diffthis, 'Diff This')
    -- map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
    -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
end

---@type LazyPluginSpec
return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost' },
    cmd = 'Gitsigns',
    ---@type Gitsigns.Config
    opts = {
        on_attach = function(buffer)
            set_keymaps(buffer)
        end,
    },
}
