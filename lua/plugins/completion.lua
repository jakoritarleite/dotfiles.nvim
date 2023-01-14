return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = function(plugin, opts)
            local cmp = require("cmp")

            -- How make this work ?
            -- cmp.setup.cmdline('/', {
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = {{
            --         name = 'buffer'
            --     }}
            -- })

            -- cmp.setup.cmdline(':', {
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = cmp.config.sources({{
            --         name = 'path'
            --     }}, {{
            --             name = 'cmdline'
            --         }})
            -- })

            return {
                snippet = { 
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-Down>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources(
                    {
                        { name = "nvim_lsp" }
                    },
                    {
                        { name = "vsnip" }
                    },
                    {
                        { name = "buffer" }
                    }
                ),
                view = {
                    entries = "native"
                }
            }
        end
    }
}
