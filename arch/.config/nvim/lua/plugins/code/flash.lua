return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        config = function(_)
            vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#39480c", bg = "#bef129", bold = true })
        end,
        modes = {
            char = {
                jump_labels = true,
                highlight = { backdrop = false },
                autohide = true,
            },
            treesitter_search = {
                label = { rainbow = { enabled = true } },
                remote_op = { motion = true },
            },
        },
    },
}
