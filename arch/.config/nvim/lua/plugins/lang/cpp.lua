return {
    { import = "lazyvim.plugins.extras.lang.clangd" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "p00f/clangd_extensions.nvim",
                inlay_hints = {
                    inline = vim.fn.has("nvim-0.10") == 1,
                },
            },
        },
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    on_attach = function(client, _)
                        require("clangd_extensions.inlay_hints").setup_autocmd()
                        require("clangd_extensions.inlay_hints").set_inlay_hints()
                    end,
                },
            },
        },
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     opts = function(_, opts)
    --         vim.list_extend(opts.ensure_installed, { "cmake", "cpp" })
    --     end,
    -- },
    -- {
    --     "neovim/nvim-lspconfig",
    --     opts = {
    --         servers = {
    --             clangd = {
    --                 mason = false,
    --                 capabilities = { offsetEncoding = { "utf-16" } },
    --             },
    --         },
    --     },
    -- },
}
