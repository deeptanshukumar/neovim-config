return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio", -- REQUIRED for nvim-dap-ui in 2026
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        
        -- Corrected: Setup nvim-dap-ui
        dapui.setup() 

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- FIX: Remove () from toggle_breakpoint
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {}) 
        vim.keymap.set("n", "<Leader>dc", function() dap.continue() end, {})
    end,
}





