-- Set Leader Key
vim.g.mapleader = " "

-- Yank and paste from clipboard
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("v", "<Leader>p", '"+p')
vim.keymap.set("n", "<Leader>p", '"+p')

-- Quickfix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zzzv")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zzzv")

-- Select the last changed text
vim.keymap.set("n", "gp", "`[v`]")

-- Terminal mappings
vim.keymap.set("t", "<C-^>", "<C-\\><C-n><C-^>")
vim.keymap.set("t", "<C-w>w", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>c", "<C-\\><C-n><C-w>c")
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-w>v", "<C-\\><C-n><C-w>v")
