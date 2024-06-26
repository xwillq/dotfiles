local M = {}

---@type PluginLspKeys
M._keys = nil

---Get general lsp keymaps
---@return (LazyKeys|{has?:string})[]
function M.get()
    if not M._keys then
        ---@class PluginLspKeys
        M._keys =  {
            { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
            { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
            { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
            { "K", vim.lsp.buf.hover, desc = "Hover" },
            { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
            { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
            { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
            { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
            { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
            { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
            { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
            { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
            --{ "<leader>cf", format, desc = "Format Document", has = "formatting" },
            --{ "<leader>cf", format, desc = "Format Range", mode = "v", has = "rangeFormatting" },
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
            {
                "<leader>cA",
                function()
                    vim.lsp.buf.code_action({
                        context = {
                            only = {
                                "source",
                            },
                            diagnostics = {},
                        },
                    })
                end,
                desc = "Source Action",
                has = "codeAction",
            }
        }
        if require("util").has("inc-rename.nvim") then
            M._keys[#M._keys + 1] = {
                "<leader>cr",
                function()
                    local inc_rename = require("inc_rename")
                    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
                end,
                expr = true,
                desc = "Rename",
                has = "rename",
            }
        else
            M._keys[#M._keys + 1] = { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
        end
    end
    return M._keys
end

---Check if lsp supports required action
---@param method string
function M.has(buffer, method)
    method = method:find("/") and method or "textDocument/" .. method
    local clients = vim.lsp.get_active_clients({ bufnr = buffer })
    for _, client in ipairs(clients) do
        if client.supports_method(method) then
            return true
        end
    end
    return false
end

---Get keymaps for specified buffer
function M.resolve(buffer)
    local Keys = require("lazy.core.handler.keys")
    local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

    local function add(keymap)
        local keys = Keys.parse(keymap)
        if keys[2] == false then
            keymaps[keys.id] = nil
        else
            keymaps[keys.id] = keys
        end
    end

    -- Add general keymaps
    for _, keymap in ipairs(M.get()) do
        add(keymap)
    end

    -- Add language server specific keymaps
    local clients = vim.lsp.get_active_clients({ bufnr = buffer })
    for _, client in ipairs(clients) do
        local success, config = pcall(require, "lsp.servers." .. client.name)
        if success and config.keymaps then
            for _, keymap in ipairs(config.keymaps) do
                add(keymap)
            end
        end
    end
    return keymaps
end

function M.on_attach(client, buffer)
    local Keys = require("lazy.core.handler.keys")
    local keymaps = M.resolve(buffer)

    for _, keys in pairs(keymaps) do
        if not keys.has or M.has(buffer, keys.has) then
            local opts = Keys.opts(keys)
            ---@diagnostic disable-next-line: no-unknown
            opts.has = nil
            opts.silent = opts.silent ~= false
            opts.buffer = buffer
            vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
        end
    end
end

function M.diagnostic_goto(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

return M
