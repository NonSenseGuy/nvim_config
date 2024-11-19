return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-plenary',
  },

  keys = {
    {
      '<leader>nts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[N]eo[t]est [s]ummary',
    },
    {
      '<leader>ntn',
      function()
        require('neotest').run.run()
      end,
      desc = '[N]eo[t]est run [n]earest',
    },
    {
      '<leader>ntf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[N]eo[t]est run [f]ile',
    },
    {
      '<leader>ntw',
      function()
        require('neotest').watch.toggle()
      end,
      desc = '[N]eo[t]est [w]atch',
    },
    {
      '<leader>nto',
      function()
        require('neotest').neotest.output_panel.toggle()
      end,
      desc = '[N]eo[t]est [o]pen panel',
    },
  },

  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
          runner = 'pytest',
        },
        require 'neotest-plenary',
      },
    }

    -- vim.keymap.set('n', '<leader>nts', neotest.summary.toggle(), { desc = '[N]eo[t]est [s]ummary' })
    -- vim.keymap.set('n', '<leader>ntw', neotest.watch.toggle(), { desc = '[N]eo[t]est [w]atch' })
    -- vim.keymap.set('n', ']n', neotest.jump.next { status = 'failed' }, { desc = 'jump next failed test' })
    -- vim.keymap.set('n', '[n', neotest.jump.prev { status = 'failed' }, { desc = 'jump prev failed test' })
  end,
}
