require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_check_bracket_line = false,
})

