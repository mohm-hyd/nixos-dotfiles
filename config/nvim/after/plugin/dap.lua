local dap = require("dap")
local dapui = require("dapui")

-- Setup UI and Virtual Text
dapui.setup()
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', ctermfg = 'Blue' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379', ctermfg = 'Green', bold = true })

-- Automatically open/close UI tabs on debug events
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
dap.set_log_level("DEBUG")

vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint,
    { desc = "Debug: Toggle Breakpoint", silent = true, nowait = true })
vim.keymap.set("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Conditional Breakpoint" })


dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
dap.defaults.fallback.terminal_win_cmd = '20split new'

dap.configurations.c = {
    {
        name = "Launch (Supports std::cin)",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        -- 1. Prompt for runtime arguments, or leave it blank
        args = function()
            local args_string = vim.fn.input('Arguments (optional): ')
            return vim.split(args_string, " ")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
        -- 2. THIS IS THE KEY: Tells nvim-dap to spawn a Neovim :terminal buffer
        console = "integratedTerminal",
        runInTerminal = true
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
    }
}

dap.configurations.cpp = dap.configurations.c
