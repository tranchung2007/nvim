return {
	name = "g++",
	builder = function()
		local file = vim.fn.expand("%:p")
		local file_path = vim.fn.expand("%:p:h")
		local file_base_name = vim.fn.expand("%:t:r")
		local cmd = "bash"
		local args = {
			"-c",
			string.format(
				"g++ -std=c++14 -O2 '%s' -o '%s/%s.out' && xfce4-terminal -e 'bash -c \"%s/%s.out;echo;echo;echo Press ENTER to continue; read line; rm %s/%s.out; exit; exec bash\"'",
				file,
				file_path,
				file_base_name,
				file_path,
				file_base_name,
				file_path,
				file_base_name
			),
		}
		return {
			cmd = { cmd },
			args = args,
			components = { { "on_output_quickfix", open = false }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
