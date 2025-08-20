return {
    {
        "saghen/blink.cmp",
        version = "1.6.0",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            appearance = {
                nerd_font_variant = 'mono',
                -- use_nvim_cmp_as_default = true,
                -- highlight_ns = vim.api.nvim_create_namespace('blink_cmp')
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
                list = {
                    selection = { preselect = false, auto_insert = true }
                },
            },
            sources = {
                default = { "lsp", "buffer", "snippets", "path" },
            },
            fuzzy = {
                sorts = { "exact", "score", "sort_text" },
                implementation = "rust"
            },
            keymap = {
                preset = "default",
                ["<C-Up>"] = { "select_prev", "fallback" },
                ["<C-Down>"] = { "select_next", "fallback" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
            },
            signature = {
                enabled = false,
                window = { show_documentation = false }
            },
        },
        opts_extend = { 'sources.default' },
    }
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-cmdline",
    --         "dcampos/nvim-snippy",
    --         "dcampos/cmp-snippy",
    --         "onsails/lspkind.nvim"
    --     },
    --     opts = function()
    --         local cmp = require("cmp")
    --         local lspkind = require("lspkind")

    --         -- How make this work ?
    --         cmp.setup.cmdline('/', {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = { {
    --                 name = 'buffer'
    --             } }
    --         })

    --         cmp.setup.cmdline(':', {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = cmp.config.sources({ {
    --                 name = 'path'
    --             } }, { {
    --                 name = 'cmdline'
    --             } })
    --         })

    --         return {
    --             snippet = {
    --                 expand = function(args)
    --                     require('snippy').expand_snippet(args.body)
    --                 end
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
    --                 ["<C-Down>"] = cmp.mapping.scroll_docs(4),
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<C-e>"] = cmp.mapping.abort(),
    --                 ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --             }),
    --             sources = cmp.config.sources({
    --                 { name = "nvim_lsp" },
    --                 { name = "buffer", option = { keyword_pattern = [[\k\+]] } },
    --                 { name = "path" },
    --                 { name = "snippy" },
    --             }),
    --             formatting = {
    --                 format = lspkind.cmp_format({
    --                     mode = "symbol_text",
    --                     menu = ({
    --                         buffer = "[Buffer]",
    --                         nvim_lsp = "[LSP]",
    --                         luasnip = "[LuaSnip]",
    --                         nvim_lua = "[Lua]",
    --                         latex_symbols = "[Latex]",
    --                     })
    --                 })
    --             }
    --         }
    --     end
    -- }
}
