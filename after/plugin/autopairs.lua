require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
})

require('nvim-ts-autotag').setup({
    check_ts = true,
})
