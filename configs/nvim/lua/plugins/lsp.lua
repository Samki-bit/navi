return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
	        {"mason-org/mason.nvim", config = true },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = { "lua_ls", "rust_analyzer", 'clangd', 'neocmake', 'pyright'},
                },
            },
    	},

        config =  function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        vim.lsp.enable('lua_ls')
        vim.keymap.set('n', 'D', vim.lsp.buf.hover, {noremap = true})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,{})

        vim.lsp.enable("clangd")
        vim.lsp.enable("neocmake")
        vim.lsp.enable("pyright")
    end,
    }
}
