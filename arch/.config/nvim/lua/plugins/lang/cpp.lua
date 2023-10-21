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
                clangd = {
                    mason = false,
                    capabilities = { offsetEncoding = { "utf-16" } },
                },
            },
        },
    },
}
