return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				cpp = {
					"cd $dir &&",
					"clang++ -O2 $fileName -o $fileNameWithoutExt &&",
					"./$fileNameWithoutExt &&",
					"rm -f $fileNameWithoutExt",
				},
				c = function()
					local c_base = {
						"cd $dir &&",
						"cc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,
			},
		})
		vim.keymap.set({ "n" }, "<leader>b", "<CMD>w<CR> <CMD>RunCode<CR>")
	end,
}
