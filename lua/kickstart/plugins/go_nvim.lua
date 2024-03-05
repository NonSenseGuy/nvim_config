return {
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
    },
    config = function()
      require('go').setup {
        verbose = false,
        dap_debug = true,
        dap_debug_keymap = false,
        dap_debug_gui = true,
        dap_debug_vt = true,
        lsp_cfg = false,
        lsp_gofumpt = false,
        lsp_on_attach = false,
        gopls_cmd = nil,
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
}
