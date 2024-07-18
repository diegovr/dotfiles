return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")
			-- local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[                                                                                           ]],
				[[                                                                                           ]],
				[[                                                                                           ]],
				[[                                                                                           ]],
				[[                                                                                         ]],
				[[                           ████ ██████           █████      ██                     ]],
				[[                          ███████████             █████                             ]],
				[[                          █████████ ███████████████████ ███   ███████████   ]],
				[[                         █████████  ███    █████████████ █████ ██████████████   ]],
				[[                        █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[                      ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[                     ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                                           ]],
				[[                                                                                           ]],
				[[                                                                                           ]],
			}
			-- dashboard.section.buttons.val = {
			--     dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			--     dashboard.button("f", "   Find file", "<Leader>f"),
			--     dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
			--     dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
			--     dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
			--     dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
			-- }
			-- This is a test for local changes

			alpha.setup(dashboard.opts)
		end,
	},
}
