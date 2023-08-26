return {
    -- { import = "lazyvim.plugins.extras.coding.copilot" },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            -- remove ghost text
            opts.experimental = nil
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    -- debounce = 25,
                },
                filetypes = {
                    ["*"] = true,
                },
            })
        end,
    },
}
