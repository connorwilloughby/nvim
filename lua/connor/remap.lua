vim.g.mapleader = " "

-- Get to files quicker
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Fugitive
vim.keymap.set("n", "<leader>gd", "<cmd>G diff<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>G pull<CR>")
vim.keymap.set("n", "<leader>gs", ":G checkout -p \"")
vim.keymap.set("n", "<leader>gc", ":G commit -m \"")

-- quick source
vim.keymap.set("n", "<leader><leader>", "<cmd>:so<CR>")

-- lsp stuff
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)

-- Format quicker
vim.keymap.set("n", "<leader>l", vim.lsp.buf.format)
