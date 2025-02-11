return {
	"maxmx03/fluoromachine.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local fm = require("fluoromachine")

		fm.setup({
			glow = false,
			theme = "retrowave",
			transparent = false,
			colors = function(_, color)
				local darken = color.darken
				-- local lighten = color.lighten
				-- local blend = color.blend
				-- local shade = color.shade
				-- local tint = color.tint
				return {
					bg = darken("#190920", 23),
				}
			end,
		})
		vim.cmd.colorscheme("fluoromachine")
	end,
}
