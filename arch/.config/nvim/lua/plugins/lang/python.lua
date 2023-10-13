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
            table.insert(opts.ensure_installed, "black")
            -- table.insert(opts.ensure_installed, "mypy")
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "black" },
            },
        },
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     opts = {
    --         linters_by_ft = {
    --             python = { "mypy" },
    --         },
    --     },
    -- },
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
