return {
    {
        "navarasu/onedark.nvim",
        opts = {
            code_style = {
                comments = "italic",
                keywords = "italic",
                functions = "bold",
                strings = "nocombine",
                variables = "none",
            },
            colors = {
                blue = "#17afff", -- override
                forest_green = "#689d6a",
                magenta = "#b16286",
                pink = "#d4879c",
            },
            highlights = {
                ["@method"] = { fg = "$blue", fmt = "bold" },
                ["@repeat"] = { fg = "$purple", fmt = "none" },
                ["@conditional"] = { fg = "$purple", fmt = "none" },
                ["@keyword.operator"] = { fg = "$purple", fmt = "none" },
                ["@keyword.function"] = { fg = "$purple", fmt = "none" },
                ["@type.qualifier"] = { fg = "$magenta" },
                ["@boolean"] = { fg = "$dark_yellow" },
                ["@constant"] = { fg = "$pink", style = "bold" },
                ["@definition.constant"] = { fg = "$pink", style = "bold" },
                ["@constant.builtin"] = { fg = "$pink" },
                ["@parameter.reference"] = { fg = "$red" },

                -- ["@lsp.type.keyword"] = { fg = "$magenta", fmt = "nocombine" },
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        },
    },
}
