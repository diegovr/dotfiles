return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
    {
        "lunarvim/darkplus.nvim",
        lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("darkplus")
		end,
    },
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				palettes = {
					nordfox = {
						bg0 = "#1e2326",
						bg1 = "#1E1E1E", -- default background
					},
				},
			})
			-- vim.cmd.colorscheme("nordfox")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa.nvim",
		-- priority = 1000,
		-- config = function()
		-- require("kanagawa").setup({
		-- 	compile = false, -- enable compiling the colorscheme
		-- 	undercurl = true, -- enable undercurls
		-- 	commentStyle = { italic = true },
		-- 	functionStyle = {},
		-- 	keywordStyle = { italic = true },
		-- 	statementStyle = { bold = true },
		-- 	typeStyle = {},
		-- 	transparent = true, -- do not set background color
		-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
		-- 	colors = { -- add/modify theme and palette colors
		-- 		palette = {},
		-- 		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		-- 	},
		-- 	overrides = function(colors) -- add/modify highlights
		-- 		return {}
		-- 	end,
		-- 	theme = "dragon", -- Load "wave" theme when 'background' option is not set
		-- 	background = { -- map the value of 'background' option to a theme
		-- 		dark = "dragon", -- try "dragon" !
		-- 		light = "lotus",
		-- 	},
		-- })
		--vim.cmd.colorscheme("kanagawa-dragon")
		-- 	end,
	},
}
