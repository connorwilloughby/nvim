require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
	["pylsp"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.pylsp.setup({
			settings = {
				Python = {
					-- TODO: add a custom interpreter for python paths
				},
				plugins = {
					pycodestyle = {
						maxLineLength = 88,
					},
					flake8 = {
						maxLineLength = 88,
					},
				},
			},
		})
	end,
	["ts_ls"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({
			settings = {
				typescript = {
					format = {
						enable = false,
					},
				},
			},
		})
	end,
	["lua_ls"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
	-- -- ["yamlls"] = function()
	-- -- 	local lspconfig = require("lspconfig")
	-- -- 	lspconfig.yamlls.setup({
	-- -- 		settings = {
	-- -- 			yaml = {},
	-- -- 		},
	-- 	})
	-- end,
})
