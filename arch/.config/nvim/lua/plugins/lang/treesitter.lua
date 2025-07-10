return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(
                opts.ensure_installed,
                { "gitignore", "gitcommit", "gitattributes", "git_config", "git_rebase", "bash", "diff" }
            )
        end,
    },
}
