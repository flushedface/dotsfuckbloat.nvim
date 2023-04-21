-- This file is automatically loaded by plugins.init

local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

autocmd("InsertEnter", {
  callback = function()
    o.relativenumber = false
  end,
})

autocmd("InsertLeave", {
  callback = function()
    o.relativenumber = true
  end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query", -- :InspectTree
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

autocmd("BufWritePre", {
  callback = function()
    vim.cmd("Neoformat")
  end,
})

autocmd("CursorHold", {
  callback = function()
    vim.cmd("Lspsaga hover_doc")
  end,
})
