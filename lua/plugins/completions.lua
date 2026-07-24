return {

	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
		})
	end,
}
