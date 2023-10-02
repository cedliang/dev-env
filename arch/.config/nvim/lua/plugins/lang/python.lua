return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            -- table.insert(opts.ensure_installed, "yapf")
            table.insert(opts.ensure_installed, "black")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            -- table.insert(opts.sources, require("null-ls").builtins.formatting.yapf)
            table.insert(opts.sources, require("null-ls").builtins.formatting.black)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {},
            },
            setup = {
                pyright = function(_, opts)
                    require("lspconfig").pyright.setup({
                        settings = {
                            pyright = {
                                typeCheckingMode = "strict",
                            },
                        },
                    })
                    return true
                end,
            },
        },
    },
    {
        "linux-cultist/venv-selector.nvim",
        cmd = "VenvSelect",
        opts = {},
        keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    },
}
