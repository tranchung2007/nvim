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
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				single_file_support = true,
				cmd = {
					"clangd",
					"--clang-tidy",
					"--completion-style=bundled",
					"--header-insertion=never",
					"--limit-references=10",
					"--limit-results=10",
					"--fallback-style=microsoft",
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.hyprls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
