return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(
                opts.ensure_installed,
                { "gitignore", "gitcommit", "gitattributes", "git_config", "git_rebase", "bash", "diff" }
            )
        end,
    },
}
