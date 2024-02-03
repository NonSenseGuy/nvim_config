require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "vimdoc",
        "javascript",
        "typescript",
        "css",
        "c",
        "lua",
        "rust",
        "go",
        "python",
        'json',
        'yaml',
        'html',
        'toml'
    },
    autotag = {
        enable = true,
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { 'org' },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>mm", -- set to `false` to disable one of the mappings
            node_incremental = "<leader>mm",
            scope_incremental = "<leader>ms",
            node_decremental = "<leader>mn",
        },
    },
}