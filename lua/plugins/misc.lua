return {
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{
		"crispgm/nvim-tabline",
		config = function()
			require("tabline").setup({
				show_index = false,
				show_modify = true,
				show_icon = false,
				fnamemodify = ":t",
				modify_indicator = "*",
				no_name = " :(( ",
				brackets = { "", "" },
				inactive_tab_max_length = 0,
			})
		end,
	},
}
