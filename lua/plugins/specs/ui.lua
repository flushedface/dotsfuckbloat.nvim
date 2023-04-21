local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "folke/noice.nvim",
    config = function()
      require("ui.noice")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    event = {
      "VeryLazy",
    },
  },
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("ui.dashboard")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. "dashboard-nvim", {}),
        callback = function()
          local file = vim.fn.expand("%")
          local condition = (file == "NvimTree_1" or file == "[lazy]" or file == "")
          if (condition) then
            require("lazy").load({ plugins = "dashboard-nvim" })
          end
        end
      })
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "BufReadPost",
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      require("ui.heirline")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    {
      "catppuccin/nvim",
      config = function()
        require("ui.catppuccin")
      end,
    },
    "FrenzyExists/aquarium-vim",
    {
      "wuelnerdotexe/vim-enfocado",
      config = function()
        vim.g.enfocado_style = "nature" -- You can go for "neon" too.
      end,
    },
    {
      "folke/tokyonight.nvim",
      config = function()
        require("ui.tokyonight")
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("ui.kanagawa")
      end,
    },
    "VonHeikemen/little-wonder",
  },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      vim.schedule(function()
        require("drop").setup({
          theme = "stars",
        })
      end)
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    event = "VeryLazy",
    cmds = {
      "ZenMode",
      "close",
      "quit",
    },
    dependencies = {
      {
        "folke/twilight.nvim",
      },
    },
  },
  {
    "gen740/SmoothCursor.nvim",
    event = "CursorMoved",
    config = true,
  },
}
