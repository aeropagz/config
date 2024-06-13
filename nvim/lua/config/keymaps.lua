-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F2>", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "<F6>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F7>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F8>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<", "{")
vim.keymap.set("n", ">", "}")
