return {
  {
    'folke/tokyonight.nvim',
  },
  {
    'cdmill/neomodern.nvim',
    lazy = 'VeryLazy',
    priority = 1000,
    config = function()
      require('neomodern').setup {
        -- optional configuration here
      }
      -- require('neomodern').load()
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme 'rosebones'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'nyoom-engineering/oxocarbon.nvim',
    lazy = 'VeryLazy', -- make sure we load this during startup if it is your main colorscheme
    -- config = function()
    --   -- Load the colorscheme here
    --   vim.opt.background = 'dark'
    --   vim.cmd.colorscheme 'oxocarbon'
    --
    --   -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  --   {
  --     'zaldih/themery.nvim',
  --     lazy = false,
  --     config = function()
  --       require('themery').setup {
  --         themes = { 'oxocarbon', 'tokyonight', 'neomodern', 'zenbones', 'rosebones', 'default', 'minischeme' },
  --         livePreview = true,
  --       }
  --     end,
  --   },
}
-- vim: ts=2 sts=2 sw=2 et
