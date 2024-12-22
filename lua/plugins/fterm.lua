return {
	"numToStr/FTerm.nvim",
	config = function()
		vim.keymap.set("n", "<A-t>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		vim.api.nvim_create_user_command("CppBuild", function()
			local filepath = vim.fn.expand("%:p")
			local filename = vim.fn.expand("%:t:r")
			local cmd = string.format(
				'g++ -std=c++14 -O2 "%s" -o "%s.out" && ./%s.out; echo; echo; echo Press ENTER to continue; read line; rm -r %s.out',
				filepath,
				filename,
				filename,
				filename
			)
			require("FTerm").scratch({ cmd = { "bash", "-c", cmd } })
		end, { bang = true })
	end,
}
