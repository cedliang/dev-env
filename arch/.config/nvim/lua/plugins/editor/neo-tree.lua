return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            source_selector = {
                winbar = true,
                content_layout = "center",
                sources = {
                    { source = "filesystem", display_name = "󰉓 " },
                    { source = "buffers", display_name = "󰈚" },
                    { source = "git_status", display_name = "󰊢" },
                    { source = "document_symbols", display_name = " " },
                },
                tabs_layout = "active",
                show_separator_on_edge = true,
                separator_active = "",
            },
            window = {
                mappings = {
                    ["<"] = "close_node",
                    [">"] = "toggle_node",
                    ["H"] = "prev_source",
                    ["L"] = "next_source",
                },
            },
            filesystem = {
                bind_to_cwd = true,
            },
        },
    },
}
