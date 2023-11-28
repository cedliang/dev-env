return {
    {
        "akinsho/bufferline.nvim",
        opts = function(_, opts)
            opts.options.always_show_bufferline = true
            opts.options.separator_style = "slant"
            -- opts.options.separator_style = { "", "" }
            opts.options.offsets = false
            opts.options.offsets = {
                {
                    filetype = "neo-tree",
                    text = function()
                        return vim.fn.getcwd():match("([^" .. package.config:sub(1, 1) .. "]+)$")
                    end,
                    text_align = "center",
                    -- highlight = "BufferLinePickSelected",
                    highlight = "BufferLineErrorDiagnosticSelected",
                },
            }
            opts.options.indicator = {
                style = "none",
            }
            opts.options.show_buffer_close_icons = false
        end,
    },
}
