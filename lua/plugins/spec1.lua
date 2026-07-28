return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "https://github.com/BurntSushi/ripgrep" }, -- is required for live_grep and grep_string and is the first priority for find_files.
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
				enable = true,
				},
				ensure_installed = {
				    "markdown",
				    "markdown_inline",
				    "python",
				    "lua",
			   	},
			})
		end,
	},
	{
		"mofiqul/vscode.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd.colorscheme("vscode")
		end,
	},
}
