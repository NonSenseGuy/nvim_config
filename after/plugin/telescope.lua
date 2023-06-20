local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {desc = "[G]it [F]iles"})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {desc = "Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help tags"})
vim.keymap.set('n', '<leader>gs', function()
	builtin.grep_string({ search = vim.fn.input("grep > ")})
end)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})

