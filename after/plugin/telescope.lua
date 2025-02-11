local builtin = require("telescope.builtin")

require("telescope").setup({
	extensions = {
		project = {
			base_dirs = { "C:\\Users\\Connor\\Documents\\Github", "C:\\Users\\Connor\\AppData\\Local" },
			hidden_files = true,
		},
	},
})
require("telescope").load_extension("project")
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope project<CR>", { noremap = true, silent = true })

-- Standard maps
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fj", builtin.jumplist, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.keymap.set("n", "<leader>fv", function()
	builtin.git_files({ cwd = "~\\AppData\\local\\nvim" })
end)
vim.keymap.set("n", "<leader>fd", function()
	builtin.find_files({ cwd = "~\\AppData\\local\\nvim-data" })
end)
