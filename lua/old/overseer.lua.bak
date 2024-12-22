return {
	"stevearc/overseer.nvim",
	opts = {},
	config = function()
		require("overseer").setup({
			templates = { "builtin", "user.cpp_build" },
		})
		vim.keymap.set({ "n", "i" }, "<F9>", "<esc> :w<cr>:OverseerRun g++<cr>", {})
	end,
}
