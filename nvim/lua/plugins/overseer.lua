return {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
        require("overseer").setup({
            templates = { "builtin", "user.cpp_build" },
        })
        vim.keymap.set("n", "<F9>", ":w<cr>:OverseerRun g++<cr>", {})
    end,
}
