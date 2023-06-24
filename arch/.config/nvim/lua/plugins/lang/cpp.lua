return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, { "cmake", "cpp" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = { mason = false },
            },
            setup = {
                clangd = function(_, opts)
                    require("lspconfig").clangd.setup({})
                    return true
                end,
            },
        },
    },
}
