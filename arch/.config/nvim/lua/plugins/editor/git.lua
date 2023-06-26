vim.g.gitblame_delay = 250
vim.g.gitblame_virtual_text_column = 120
vim.g.gitblame_message_template = "<summary> • <date> • <author> • <sha>"
return {
    { "f-person/git-blame.nvim", event = "BufReadPre" },
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPre",
        config = true,
    },
}
