require("nvim-treesitter").setup({
    ensure_installed = { "lua", "c", "cpp", "qml", "rst", "markdown", "html" },
    highlight = { enable = true },
    indent = { enable = true },

})
