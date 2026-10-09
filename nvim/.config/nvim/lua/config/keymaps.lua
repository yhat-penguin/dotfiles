-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local coverage = require("coverage")

vim.keymap.set("n", "<leader>tc", function()
  coverage.load(true)
end, { desc = "Load coverage" })

vim.keymap.set("n", "<leader>tC", function()
  coverage.clear()
end, { desc = "Clear coverage" })

vim.keymap.set("n", "<leader>tg", function()
  coverage.summary()
end, { desc = "Coverage Summary" })
