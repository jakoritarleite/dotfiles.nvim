return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "dcampos/nvim-snippy",
            "dcampos/cmp-snippy",
            "onsails/lspkind.nvim"
        },
        opts = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            -- How make this work ?
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { {
                    name = 'buffer'
                } }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ {
                    name = 'path'
                } }, { {
                    name = 'cmdline'
                } })
            })

            return {
                snippet = {
                    expand = function(args)
                        require('snippy').expand_snippet(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-Down>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer", option = { keyword_pattern = [[\k\+]] } },
                    { name = "path" },
                    { name = "snippy" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        })
                    })
                }
            }
        end
    }
}
