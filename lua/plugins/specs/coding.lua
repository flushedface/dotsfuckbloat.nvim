return {
  {
    "altermo/npairs-integrate-upair",
    dependencies = {
      {
        "altermo/ultimate-autopair.nvim",
      },
      "windwp/nvim-autopairs"
    },
    config = function()
      require("coding.autopairs")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    keys = {
      "ys",
      "yss",
      "ds",
      "cs",
      "yS",
      "ySS",
      { "S", mode = { "v", "x" } },
      { "gS", mode = { "v", "x" } },
      { "<C-g>s", mode = "i" },
      { "<C-g>S", mode = "i" },
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      "gcc",
      "gbc",
      { "gc", mode = { "v", "x", } },
      { "gb", mode = { "v", "x", } },
      "gcO",
      "gco",
      "gcA",
    },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("nvim-treesitter.configs").setup({
            context_commentstring = {
              enable = true,
            },
          })
        end,
      },
    },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    config = true,
  },
}

