return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        modes = {
            char = {
                jump_labels = true,
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search({ remote_op = { motion = true } }) end, desc = "Treesitter Search" },
    },
}
