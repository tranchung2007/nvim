return {
	{
		"windwp/nvim-autopairs",
		fast_wrap = {},
		event = "InsertEnter",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

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
			vim.api.nvim_set_keymap("n", "<C-.>", ":tabnext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<C-,>", ":tabprev<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew +1<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>tm", ":+tabmove<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>TM", ":-tabmove<CR>", { noremap = true, silent = true })

			-- vim.api.nvim_set_keymap("n", "<leader>f", ":tabfirst<CR>", { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>l", ":tablast<CR>", { noremap = true, silent = true })
		end,
	},
}
