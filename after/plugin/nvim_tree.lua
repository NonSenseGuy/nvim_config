local on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local map = vim.keymap.set
    local opts = function(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    map('n', 'L', api.tree.change_root_to_node, opts('CD'))
    map('n', 'H', api.tree.change_root_to_parent, opts('Up'))
    map('n', '<C-k>', api.node.show_info_popup, opts('Info'))
    map('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    map('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    map('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    map('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
    map('n', '.', api.node.run.cmd, opts('Run Command'))
    map('n', 'g?', api.tree.toggle_help, opts('Help'))
    map('n', 'o', api.node.open.edit, opts('Open'))
    map('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
    map('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    map('n', 'q', api.tree.close, opts('Close'))
    map('n', 'r', api.fs.rename, opts('Rename'))
    map('n', 'R', api.tree.reload, opts('Refresh'))
    map('n', 'c', api.fs.create, opts('Create'))
    map('n', 'D', api.fs.remove, opts('Delete'))
    map('n', 'd', api.fs.cut, opts('Cut'))
    map('n', 'p', api.fs.paste, opts('Paste'))
    map('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    map('n', 'y', api.fs.copy.filename, opts('Copy Name'))
    map('n', 'Y', api.fs.copy.node, opts('Copy'))
    map('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    map('n', '<CR>', api.node.open.edit, opts('Open'))
    map('n', 'l', api.node.open.edit, opts('Open'))
end

require('nvim-tree').setup({
    on_attach = on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,

    update_focused_file = { enable = true, update_cwd = false },
    diagnostics = { enable = true },
    view = {
        width = 30,
        side = 'left',
    },
    filters = {
        dotfiles = false,
        custom = {
            '^node_modules/', '^.git', '^.cache/', '%.o'
        }
    },
    renderer = {
        indent_markers = { enable = true },
        highlight_opened_files = 'name',
    }
})
