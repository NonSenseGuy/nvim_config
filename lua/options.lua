-- [[ Setting options ]]
-- See `:help opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
local opt = vim.opt
-- Make line numbers default
-- opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
opt.relativenumber = true
opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Sync clipboard between OS and Neo
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neowill display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '»·', trail = '•', nbsp = '␣', eol = '↲', extends = '>', precedes = '<', conceal = '┊' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
-- opt.cursorline = true
opt.cmdheight = 1
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.joinspaces = false
opt.breakindent = true

opt.linebreak = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true

opt.showbreak = '↳ ' -- prefix at the start when lines have been wrapped
--  ts=2 sts=2 sw=2 et
