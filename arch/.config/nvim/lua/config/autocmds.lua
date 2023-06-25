-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- required for lsp semantic highlighting (lsp keyword highlighting will overwrite everything)
-- we cannot yet override on a single highlighting group basis
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.api.nvim_set_hl(0, "@lsp.type.keyword", {})
    end,
})
