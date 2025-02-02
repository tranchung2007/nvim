return {
	"CRAG666/code_runner.nvim",

	config = function()
		require("code_runner").setup({
			filetype = {
				cpp = {
					"cd $dir &&",
					"g++ -O2 $fileName -o $fileNameWithoutExt &&",
					"./$fileNameWithoutExt &&",
					"rm -f $fileNameWithoutExt",
				},
			},
		})
		vim.keymap.set({ "n", "i" }, "<leader>b", "<CMD>w<CR> <CMD>RunCode<CR>")
	end,
}
