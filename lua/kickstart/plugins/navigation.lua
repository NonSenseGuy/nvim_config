return {
  'numToStr/Navigator.nvim',
  cmd = {
    'NavigatorLeft',
    'NavigatorRight',
    'NavigatorUp',
    'NavigatorDown',
  },
  keys = {
    { '<C-h>', '<cmd>NavigatorLeft<cr>', mode = { 'n', 'v' } },
    { '<C-l>', '<cmd>NavigatorRight<cr>', mode = { 'n', 'v' } },
    { '<C-k>', '<cmd>NavigatorUp<cr>', mode = { 'n', 'v' } },
    { '<C-j>', '<cmd>NavigatorDown<cr>', mode = { 'n', 'v' } },
  },
  opts = { auto_save = 'current' },
}
