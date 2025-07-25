return {
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    -- { import = "lazyvim.plugins.extras.ai.copilot" },

    -- -- full ghost config
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        -- to accept, use <M-l>
                        next = "<M-]>",
                        prev = "<M-[>",
                    },
                },
                filetypes = {
                    ["*"] = true,
                },
            })
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = { "giuxtaposition/blink-cmp-copilot" },
        opts = {
            completion = {
                ghost_text = { enabled = false },
            },
            keymap = {
                -- to hide, use <C-e>
                ["<C-n>"] = { "show", "select_next", "fallback" },
                ["<C-p>"] = { "show", "select_prev", "fallback" },
            },
        },
    },
}
