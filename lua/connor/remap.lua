vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Used to make fugitive even better
vim.keymap.set("n", "<leader>gd", "<cmd>G diff<CR>")
vim.keymap.set("n", "<leader>gc", ":G commit -m \"")
