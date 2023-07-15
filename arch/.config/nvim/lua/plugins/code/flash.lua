return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        modes = {
            char = {
                -- config = function(opts)
                --     -- autohide flash when in operator-pending mode
                --     opts.autohide = vim.fn.mode(true):find("no") and vim.v.operator == "y"
                --
                --     -- disable jump labels when enabled and when using a count
                --     opts.jump_labels = opts.jump_labels and vim.v.count == 0
                --
                --     -- disable jump labels in operator-pending mode
                --     -- opts.jump_labels = not (vim.fn.mode(true):find("no"))
                -- end,
                jump_labels = true,
                highlight = { backdrop = false },
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search({ remote_op = { motion = true } }) end, desc = "Treesitter Search" },
    },
}
