local attach_to_buffer = function(out_bufnr, pattern, command)
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = vim.api.nvim_create_augroup('automagic', { clear = true }),
        pattern = "*.go",
        callback = function()
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(out_bufnr, -1, -1, false, data)
                end
            end

            vim.api.nvim_buf_set_lines(out_bufnr, 0, -1, false, { 'main.go output:' })
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end
    })
end
