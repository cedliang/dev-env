vim.g.gruvbox_baby_use_original_palette = true
vim.g.gruvbox_baby_telescope_theme = true

return {
    {
        "luisiacc/gruvbox-baby",
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox-baby",
        },
    },
}
