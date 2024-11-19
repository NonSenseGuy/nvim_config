return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'vim',
          'vimdoc',
          'go',
          'python',
          'typescript',
          'javascript',
          'rust',
          'markdown',
          'markdown_inline',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = false },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>mm', -- set to `false` to disable one of the mappings
            node_incremental = '<leader>mm',
            scope_incremental = '<leader>ms',
            node_decremental = '<leader>mn',
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
