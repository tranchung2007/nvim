return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvimtools/none-ls.nvim",
		},
		lazy = false,
		config = function()
			for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
				vim.api.nvim_set_hl(0, group, {})
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
								vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				single_file_support = true,
				cmd = {
					"clangd",
					-- "-j 3",
					"--clang-tidy",
					-- "--completion-style=bundled",
					-- "--header-insertion=never",
					"--limit-references=10",
					"--limit-results=10",
					-- "--fallback-style=google",
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			-- vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
			-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
			-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
			-- vim.keymap.set("n", "<leader>wl", function()
			--	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end,)

			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
		end,
	},
}
