return {
    "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search({ remote_op = { motion = true } }) end, desc = "Treesitter Search" },
  },
}
