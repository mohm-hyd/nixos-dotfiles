require('oil').setup({
    default_file_explorer = true, --start neovim with oil
    keymaps = {
        ["q"] = "actions.close",
    },
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
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
