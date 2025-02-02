return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.clang-format"),
					},
				}),
				null_ls.builtins.formatting.black,
			},
		})
	end,

	vim.keymap.set({ "n", "i", "v" }, "<C-s>", vim.lsp.buf.format, {}),
}
