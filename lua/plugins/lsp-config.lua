

return{
    {
        "williamboman/mason.nvim",
        config = function()
           require("mason").setup()
         end
    },
    {
        "williamboman/mason-lspconfig.nvim", 
        config = function()
         require ("mason-lspconfig") .setup({
                ensure_installed = { "lua_ls", "clangd", "pyright"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Define capabilities (same as before)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Use vim.lsp.config() to set specific options for each server
            -- The 'capabilities' table is merged with the default config provided by nvim-lspconfig
            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
            vim.lsp.config("clangd", {
                capabilities = capabilities
            })
            vim.lsp.config("pyright", {
                capabilities = capabilities
            })

            -- Enable the language servers to activate them automatically for their file types
            -- This replaces the old require("lspconfig").SERVER.setup({}) calls
            vim.lsp.enable({ "lua_ls", "clangd", "pyright" })

            -- Set keymaps using an LspAttach autocommand to ensure they are set when the LSP client attaches
            -- This is the recommended way to set keymaps that only work when an LSP is active
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp.keymaps', { clear = true }),
                callback = function(args)
                    local bufnr = args.buf
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
                end
            })
        end
    }
}

