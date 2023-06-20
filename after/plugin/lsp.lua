require("neodev").setup()
local null_ls = require("null-ls")
local fidget = require("fidget")
local lsp = require("lsp-zero").preset({})


-- LSP INITIALIZATION
local mason_lsp = require("mason-lspconfig")

mason_lsp.setup({
    ensure_installed = {
        "eslint",
        "tsserver",
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "pyright",
    }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = function(desc)
        return { desc = 'LSP: ' .. desc, buffer = bufnr, remap = false }
    end

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts('[G]o to [D]efinition'))
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts('[G]o to [R]eference'))
    vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts('[F]ind [D]iagnostics'))
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts('[C]ode [A]ctions'))
    vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
    end, opts('[R]e[n]ame'))
end)

require('lspconfig').tsserver.setup({
    on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 3000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['eslint'] = { 'javascript', 'typescript' },
        ['null-ls'] = { 'go', 'python', 'javascript', 'typescript' },
    }
})


vim.diagnostic.config({
    virtual_text = true,
})


lsp.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»"
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.prettierd,
    },
})

fidget.setup({})
lsp.setup()

-- AUTOCOMPLETION
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_forward(),
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = require("lspkind").cmp_format({
            mode = "symbol",
            -- maxwidth = 50,
            -- ellipsis_char = "...",
            menu = {
                luasnip = "[snip]",
                nvim_lsp = "[lsp]",
                buffer = "[buf]",
                path = "[path]",
            },
            before = function(entry, vim_item)
                vim_item.dup = ({ luasnip = 0 })[entry.source.name] or 0
                return vim_item
            end
        }),
    },
})

require('go').setup()
