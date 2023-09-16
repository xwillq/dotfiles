return {
    layout = {
        height = { min = 4, max = 30 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        align = "center", -- align columns left, center or right
    },
    defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["s"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>sn"] = { name = "+noice" },
    },
}
