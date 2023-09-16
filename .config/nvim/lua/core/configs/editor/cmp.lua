local cmp = require("cmp")
local luasnip = require("luasnip")

---@diagnostic disable:missing-fields

---@class CmpConfig
---@field global cmp.ConfigSchema 
---@field cmdline {type: string|string[], config: cmp.ConfigSchema }[]
---@field filetype {type: string, config: cmp.ConfigSchema }[]
local config = {
    global = {
        completion = {
            keyword_pattern = [[\h\w*\%(-\w*\)*]],
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp", },
            { name = "luasnip" },
            { name = "path" },
            -- {
            --    name = "spell",
            --    enable_in_context = function()
            --        local context = require("cmp.config.context")
            --        return context.in_treesitter_capture("spell") or
            --            context.in_treesitter_capture("variable") or
            --            context.in_treesitter_capture("field") or
            --            context.in_treesitter_capture("function")
            --    end,
            -- },
        }),
        mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
            ["<Esc>"] = cmp.mapping.abort(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
    },
    cmdline = {
        {
            type = ":",
            config = {
                completion = {
                    autocomplete = false,
                },
                sources = cmp.config.sources({
                    { name = "cmdline" },
                    { name = "path" },
                }),
                mapping = {
                    ["<Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end, { "c" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "c" }),
                    ["<CR>"] = cmp.mapping.confirm(),
                    ["<Esc>"] = cmp.mapping.abort(),
                },
            },
        },
        {
            type = { "/", "?" },
            config = {
                completion = {
                    autocomplete = false,
                },
                sources = cmp.config.sources({
                    { name = "buffer" },
                }),
                mapping = {
                    ["<Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end, { "c" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "c" }),
                    ["<CR>"] = cmp.mapping.confirm(),
                    ["<Esc>"] = cmp.mapping.abort(),
                },
            },
        },
    },
}

config["filetype"] = {
    {
        type = "lua",
        config = {
            ---@param value cmp.SourceConfig
            sources = vim.tbl_map(function(value)
                if value.name == "nvim_lsp" then
                    value.trigger_characters = { ".", "(", ":", "," }
                end
                return value
            end, config.global.sources),
        },
    },
    {
        type = "gitcommit",
        config = {
            sources = cmp.config.sources(
                table.insert(config.global.sources, {
                    { name = "conventionalcommits" },
                })
            ),
        },
    },
}

return config
