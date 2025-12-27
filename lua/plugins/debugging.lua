return {
    "mfussenegger/nvim-dap",
    --go to this github url and :help-txt for more keybinding options--
    dependencies = {
        "rcarriga/nvim-dap-ui",
        --add more dependencies for the languages here--
        --follow this wiki for installing desired languages--
        --github.com/mfussenegger/nvim-dap/wiki/degub-adapter-installation
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint(), {})
        vim.keymap.set("n", "<Leader>dc", dap.continue(), {})
    end,
}
