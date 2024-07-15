-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.clipboard = "unnamedplus"
-- -- uncomment to force clipboard to use OSC 52
-- -- useful on headless remotes
-- local function paste()
--     return {
--         vim.fn.split(vim.fn.getreg(""), "\n"),
--         vim.fn.getregtype(""),
--     }
-- end
-- vim.g.clipboard = {
--     name = "OSC 52",
--     copy = {
--         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--     },
--     paste = {
--         ["+"] = paste,
--         ["*"] = paste,
--     },
-- }
