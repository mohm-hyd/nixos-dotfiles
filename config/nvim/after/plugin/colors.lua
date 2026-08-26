vim.cmd.colorscheme("tokyonight")
vim.cmd("hi Directory guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "LineNrAbove", {
    fg = "#828bb8",
    bg = "none",
})

vim.api.nvim_set_hl(0, "LineNrBelow", {
    fg = "#828bb8",
    bg = "none",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = "#ff966c",
    bg = "none",
    bold = true,
})
