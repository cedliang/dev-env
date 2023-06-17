-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").clangd.setup({})

require("lspconfig").hls.setup({
  filetypes = { "haskell", "lhaskell", "cabal" },
})

require("lspconfig").gopls.setup({
  cmd = { "/Users/ced/.go/bin/gopls" },
})
