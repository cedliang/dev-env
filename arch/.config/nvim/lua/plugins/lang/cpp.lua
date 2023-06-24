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
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.offsetEncoding = { "utf-16" }
                    require("lspconfig").clangd.setup({ capabilities = capabilities })
                    return true
                end,
            },
        },
    },
}
