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
			vim.api.nvim_set_keymap("n", "<leader>n", ":tabnext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>p", ":tabprev<CR>", { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>f", ":tabfirst<CR>", { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>l", ":tablast<CR>", { noremap = true, silent = true })
		end,
	},
}
