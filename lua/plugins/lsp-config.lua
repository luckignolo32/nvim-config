return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            auto_install = true,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
            vim.lsp.config("pyright", {
                capabilities = capabilities
            })
            vim.lsp.config("clangd", {
                offsetEncoding = { "utf-8", "utf-16" },
                textDocument = {
                    completion = {
                        editsNearCursor = true,
                    },
                },
                capabilities = capabilities
            })
            vim.lsp.config("postgrestools", {
                capabilities = capabilities
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end,
    },
}
