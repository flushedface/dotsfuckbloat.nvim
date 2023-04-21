local lsp = {}

lsp["williamboman/mason.nvim"] = {
  event = "BufReadPost",
  config = require("lsp.mason"),
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
}

lsp["jose-elias-alvarez/null-ls.nvim"] = {
  event = "BufReadPost",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = require("lsp.nls"),
}

lsp["j-hui/fidget.nvim"] = {
  event = "BufReadPost",
  config = require("lsp.fidget")
}

return lsp
