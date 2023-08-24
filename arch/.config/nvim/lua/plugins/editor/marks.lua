return {
    {
        "chentoast/marks.nvim",
        event = "BufReadPre",
        config = function()
            require("marks").setup({
                mappings = {
                    annotate = "<leader>ma",
                },
            })
        end,
    },
}
