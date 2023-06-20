-- -- [[ Highlight on yank ]]
-- -- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
local filetype_group = vim.api.nvim_create_augroup('FiletypeSpecific', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})


vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})

vim.api.nvim_create_autocmd('FileType', {
    group = filetype_group,
    pattern = {
        'fugitive', 'help', 'lspinfo', 'mason', 'notify', 'qf'
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end
})
