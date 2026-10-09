return {
    {
        "neovim/nvim-lspconfig",
        config = function()
        vim.lsp.config("clangd", {})
        vim.lsp.enable("clangd")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion source
            "hrsh7th/cmp-buffer",   -- Words from open buffers
            "hrsh7th/cmp-path",     -- File paths
            "L3MON4D3/LuaSnip",     -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completion source
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            })
        end,
    },

}
