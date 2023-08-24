vim.keymap.set("n", "dm<space>", "<cmd>delm!<CR>", { desc = "Delete markers" })

return {
    {
        "chentoast/marks.nvim",
        event = "BufReadPre",
        config = function()
            require("marks").setup({
                mappings = {
                    annotate = "<leader>ma",
                    delete_buf = "false",
                },
            })
        end,
    },
}
