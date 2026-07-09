vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/tokyonight.nvim" }, --tokyonight colorscheme
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('mini.pick').setup()
require('mini.pairs').setup()

require('oil').setup({
	default_file_explorer = true, --start neovim with oil
	columns = {},
	keymaps = {
		["q"] = "actions.close",
	},
	delete_to_trash = true,
	--[[view_options = {
		show_hidden = true,
	},]]--
	skip_confirm_for_simple_edits = true,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil", --Adjust if Oil uses a specific file type identifier
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
require("nvim-treesitter").setup({
	ensure_installed = { "lua", "c", "cpp","qml" },
	highlight = { enable = true },
	indent = { enable = true },
	})

vim.cmd.colorscheme("tokyonight-night")
