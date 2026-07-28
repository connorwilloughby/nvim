return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "ruff_format" },
			lua = { "stylua" },
			--markdown = { "markdownlint-cli-2" },
		},
	},
}
