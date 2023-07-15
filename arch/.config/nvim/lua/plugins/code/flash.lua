return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        modes = {
            char = {
                jump_labels = true,
                highlight = { backdrop = false },
                autohide = true,
                label = { current = false },
            },
            treesitter_search = {
                label = { rainbow = { enabled = true } },
                remote_op = { motion = true },
            },
        },
    },
}
