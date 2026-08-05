vim.g.mapleader = " "

local telescope_builtin = require("telescope.builtin")

-- Lazy stuff
vim.keymap.set("n", "<leader>l", ":Lazy<cr>")

-- get to netrw quicker
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- fugitive
vim.keymap.set("n", "<leader>gd", ":G diff<CR>")
vim.keymap.set("n", "<leader>gpl", ":G pull<CR>")
vim.keymap.set("n", "<leader>gpu", ":G push<CR>")
vim.keymap.set("n", "<leader>ga", ":G add ")
vim.keymap.set("n", "<leader>gc", ':G commit -m "')
vim.keymap.set("n", "<leader>gss", ":G status<CR>")
vim.keymap.set("n", "<leader>gsw", ":G switch -c ")

-- Telescope stuff
vim.keymap.set("n", "<leader>ts", ":Telescope<CR>")
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope project<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<CR>", {})
vim.keymap.set("n", "<leader>fl", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fj", ":Telescope jumplist<CR>", {})
-- 	find wihtin vim
vim.keymap.set("n", "<leader>fv", function()
	telescope_builtin.git_files({ cwd = "~/.config/nvim/" })
end)

-- quick source
vim.keymap.set("n", "<leader><leader>", "<cmd>:so<CR>")

-- check health rebinds
vim.keymap.set("n", "<leader>chh", "<cmd>:checkhealth<CR>")
vim.keymap.set("n", "<leader>ch", ":checkhealth ")

-- lsp stuff
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end)

-- diagnostics
vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end)

-- code interactions
vim.keymap.set("n", "<leader>va", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end)

-- mason stuff
vim.keymap.set("n", "<leader>m", "<cmd>:Mason<CR>")

-- format and save quicker
vim.keymap.set("n", "<leader>w", function()
	require("conform").format({
		async = false,
		lsp_fallback = true,
	})
	vim.cmd.update()
end)

-- shift lines up and down
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- debug shit
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end) --, "Debug: Start/Continue")
vim.keymap.set("n", "<F9>", function()
	require("dap").toggle_breakpoint()
end) --, "Debug: Toggle Breakpoint")
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end) --, "Debug: Step Over")
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end) --, "Debug: Step Into")
vim.keymap.set("n", "<S-F11>", function()
	require("dap").step_out()
end) --, "Debug: Step Out")
vim.keymap.set("n", "<F7>", function()
	require("dapui").toggle()
end) --, "Debug: See last session result.")
vim.keymap.set("n", "<C-S-F5>", function()
	require("dap").terminate() -- Stop the current session
	vim.defer_fn(function()
		require("dap").run_last() -- Restart the last session after a short delay
	end, 100) -- Small delay to ensure proper cleanup
end, { desc = "Debug: Restart Session" })
vim.keymap.set("n", "<S-F5>", function()
	require("dap").terminate() -- Stop the current session
end)

-- multi line comments
vim.keymap.set("n", "<leader>kc", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (line)" })

vim.keymap.set("x", "<leader>kc", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (selection)" })
