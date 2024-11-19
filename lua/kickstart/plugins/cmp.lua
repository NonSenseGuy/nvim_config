return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      require('luasnip.loaders.from_vscode').lazy_load()

      local lspkind = require 'lspkind'

      cmp.setup {
        view = { entries = 'custom' },
        windows = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered {
            border = 'none',
            col_offset = -2,
            winhighlight = 'Normal:Pmenu, FloatBorder:Pmenu,CursorLine:PmenuSel, Search:None',
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
          autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-n>'] = cmp.mapping.select_next_item { behaviour = cmp.SelectBehavior.Select },
          ['<C-p>'] = cmp.mapping.select_prev_item { behaviour = cmp.SelectBehavior.Select },

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping(
            cmp.mapping.confirm {
              behaviour = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { 'i', 'c' }
          ),
          ['<M-y>'] = cmp.mapping(
            cmp.mapping.confirm {
              behaviour = cmp.ConfirmBehavior.Replace,
              select = false,
            },
            { 'i', 'c' }
          ),
          ['<C-e>'] = cmp.mapping.abort(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        formatting = {
          fields = { 'abbr', 'kind', 'menu' },
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            menu = {
              buffer = '[buf]',
              nvim_lsp = '[lsp]',
              path = '[path]',
              luasnip = '[snip]',
            },
            before = function(entry, vim_item)
              vim_item.dup = ({ luasnip = 0 })[entry.source.name] or 0
              return vim_item
            end,
          },
        },
        experimental = {
          ghost_text = { hl_group = 'Comment' },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
