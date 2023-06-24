return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "haskell")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                hls = { mason = false },
            },
            setup = {
                hls = function(_, opts)
                    require("lspconfig").hls.setup({
                        filetypes = { "haskell", "lhaskell", "cabal" },
                    })
                    return true
                end,
            },
        },
    },
}
