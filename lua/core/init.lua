-- require("snips.impatient")

local vim = vim -- Avoid expensive global searching.
local g = vim.g
-- local o = vim.api.nvim_set_option_value

g.mapleader = " "

require("core.options")

local async = require "snips.async"

local loadModule = async.wrap(function(moduleName, step)
    local module = require(moduleName)
    step(module)
end)

require("core.lazy")

vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()
  async.sync(loadModule("core.autocmd"), function() end)

  async.sync(loadModule("mappings.movement"), function() end)

  async.sync(loadModule("mappings.lspsaga"), function() end)

  require("core.autocmd")
  vim.defer_fn(function ()
    require("mappings.movement")
  end, 10)
  vim.defer_fn(function ()
    require("mappings.lspsaga")
  end, 10)
end, 0)
