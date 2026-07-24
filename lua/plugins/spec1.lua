return {
       {
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
	    end,
        },
	{
	    "mason-org/mason.nvim",
	    opts = {}
	},{
	    'nvim-telescope/telescope-project.nvim',
	    dependencies = {
		'nvim-telescope/telescope.nvim',
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
	    'nvim-telescope/telescope.nvim', version = '*',
	    dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    		{ 'https://github.com/BurntSushi/ripgrep' }, -- is required for live_grep and grep_string and is the first priority for find_files.
		{"nvim-tree/nvim-web-devicons"},
	    }
	},
	{
		  "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"
	},
}
