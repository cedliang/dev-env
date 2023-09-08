return {
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            numhl = true,
        },
    },
}
