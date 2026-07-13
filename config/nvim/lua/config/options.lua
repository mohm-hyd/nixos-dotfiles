--options
local set = vim.opt

set.relativenumber = true
set.number = true

set.tabstop = 4
set.softtabstop =4
set.shiftwidth = 4
set.autoindent = true
set.smartindent = true
set.expandtab = true

set.ignorecase = true
set.smartcase = true

set.termguicolors  = true
set.background = "dark"
set.signcolumn = "yes"

set.cursorline = true

set.winborder = "rounded"

set.wrap = false
set.inccommand = "split"

set.splitbelow = true
set.splitright = true

set.laststatus = 3

set.swapfile = false
set.backup = false
set.undodir = vim.fn.stdpath("data") .. "/undodir"
set.undofile = true

set.clipboard = "unnamedplus"
set.isfname:append("@-@")
--set.guicursor = ""
set.scrolloff = 8



vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (cpying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

