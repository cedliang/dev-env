-- vim.g.gruvbox_baby_use_original_palette = false
-- vim.g.gruvbox_baby_telescope_theme = true
-- return {
--     { "luisiacc/gruvbox-baby" },
--     {
--         "LazyVim/LazyVim",
--         opts = {
--             colorscheme = "gruvbox-baby",
--         },
--     },
-- }

local palette = {
    black = "#181a1f",
    bg0 = "#282c34",
    bg1 = "#31353f",
    bg2 = "#393f4a",
    bg3 = "#3b3f4c",
    bg_d = "#21252b",
    bg_blue = "#73b8f1",
    bg_yellow = "#ebd09c",
    fg = "#abb2bf",
    purple = "#c678dd",
    green = "#98c379",
    forest_green = "#689d6a",
    orange = "#d19a66",
    blue = "#61afef",
    yellow = "#e5c07b",
    cyan = "#56b6c2",
    magenta = "#b16286",
    pink = "#D4879C",
    red = "#e86671",
    grey = "#5c6370",
    light_grey = "#848b98",
    dark_cyan = "#2b6f77",
    dark_red = "#993939",
    dark_yellow = "#93691d",
    dark_purple = "#8a3fa0",
    diff_add = "#31392b",
    diff_delete = "#382b2c",
    diff_change = "#1c3448",
    diff_text = "#2c5372",
}
local code_style = {
    comments = "italic",
    keywords = "italic",
    functions = "bold",
    strings = "nocombine",
    variables = "none",
}
vim.g.onedark_config = {
    code_style = code_style,
    highlights = {
        ["@method"] = { fg = palette.blue, fmt = code_style.functions },
        ["@repeat"] = { fg = palette.purple, fmt = "none" },
        ["@conditional"] = { fg = palette.purple, fmt = "none" },
        ["@keyword.operator"] = { fg = palette.purple, fmt = "none" },
        ["@keyword.function"] = { fg = palette.purple, fmt = "none" },
        ["@type.qualifier"] = { fg = palette.magenta },
        ["@boolean"] = { fg = palette.dark_yellow },
        ["@constant"] = { fg = palette.pink, style = "bold" },
        ["@definition.constant"] = { fg = palette.pink, style = "bold" },
        ["@constant.builtin"] = { fg = palette.pink },
        ["@parameter.reference"] = { fg = palette.red },

        -- ["@lsp.type.keyword"] = { fg = palette.magenta, fmt = "nocombine" },
    },
}
return {
    { "navarasu/onedark.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        },
    },
    -- { "xiyaowong/transparent.nvim" },
}
