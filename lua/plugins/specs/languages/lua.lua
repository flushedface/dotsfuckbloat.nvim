return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              runtime = {
                pathStrict = true,
              },
              completion = {
                callSnippet = "Both",
              },
              diagnostics = {
                globals = {
                  "vim",
                },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                  [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = false,
              },
            },
          },
        },
      },
    },
    dependencies = {
      "folke/neodev.nvim",
      opts = {},
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    optional = true,
    opts = {
      sources = {
        stylua = {
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml" })
          end,
        },
      },
    },
  },
}
