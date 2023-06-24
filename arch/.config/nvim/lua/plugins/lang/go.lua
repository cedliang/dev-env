return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "go")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                gopls = { mason = false },
            },
            setup = {
                gopls = function(_, _)
                    require("lspconfig").gopls.setup({
                        cmd = { "/Users/ced/.go/bin/gopls" },
                        settings = {
                            gopls = {
                                semanticTokens = true,
                            },
                        },
                    })
                    return true
                end,
            },
        },
    },
}
