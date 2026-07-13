vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
})

local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 24
    opts.wrap = opts.wrap ~= false
    return orig(contents, syntax, opts, ...)
end



--Lua language server
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git", ".lua", "init.lua" },
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

--C and C++ language server
vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { ".git", "compile_commands.json", "Makefile" },
})

vim.lsp.config("nil", {
    cmd = { "nil" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "default.nix", ".git" },
})

vim.lsp.enable({
    "lua_ls",
    "clangd",
    "gopls",
    "nil",
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float)


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.opt.autocomplete = true
vim.opt.complete:append("o")
vim.opt.completeopt:append { "menuone", "noselect" }

vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true })

vim.opt.pumheight = 5
vim.opt.pumborder = "rounded"
vim.opt.pumblend = 20
