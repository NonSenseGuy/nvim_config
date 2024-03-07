return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      graph_style = 'unicode',
      kind = 'vsplit',
      vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = '[n]eo[g]it' }),
    },
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signcolumn = true,
      word_diff = false,
      status_formatter = nil,
      preview_config = { border = 'rounded' },
      current_line_blame_opts = {
        delay = 250,
        virt_text_pos = 'eol',
      },
      current_line_blame_formatter_opts = { relative_time = false },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']h', function()
          if vim.wo.diff then
            return ']h'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'next [h]unk' })

        map('n', '[h', function()
          if vim.wo.diff then
            return '[h'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'previous [h]unk' })

        -- Actions
        map('n', '<leader>gs', '<cmd>Gitsigns<cr>', { desc = '[g]it [s]igns' })
        map('n', '<leader>hs', gs.stage_hunk, { desc = '[h]unk [s]tage' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = '[h]unk [r]eset' })
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[h]unk [stage]' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[h]unk [r]eset' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = '[h]unk buffer [S]tage' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[h]unk [u]ndo' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = '[h]unk buffer [R]eset' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = '[h]unk [p]review' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = true }
        end, { desc = '[h]unk [b]lame' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[t]oggle [b]lame' })
        map('n', '<leader>hd', gs.diffthis, { desc = '[h]unk [d]iff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    },
  },
}
