local Util = require('util.lazy')

---@type LazyPluginSpec[]
return {
    {
        'stevearc/conform.nvim',
        opts = Util.lazy_opts(),
    },
}
