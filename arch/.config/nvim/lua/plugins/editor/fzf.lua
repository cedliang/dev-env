return {
    {
        "ibhagwan/fzf-lua",
        opts = function(_, opts)
            opts.files.actions["enter"] = require("fzf-lua.actions").file_edit
        end,
    },
}
