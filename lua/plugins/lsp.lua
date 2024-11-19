return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "SmiteshP/nvim-navic",
            "folke/neodev.nvim",
        },
        opts = {
            diagnostics = {
                virtual_text = true,
                signs = false,
                underline = true,
                update_in_insert = false,
            },
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace"
                            }
                        }
                    }
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            diagnostics = {
                                disabled = { "unresolved-proc-macro" }
                            },
                            cargo = { allFeatures = true },
                            checkOnSave = {
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            imports = {
                                granularity = {
                                    group = "item"
                                }
                            }
                        }
                    }
                },
                clangd = {},
                cmake = {},
                dockerls = {},
                eslint = {},
                gopls = {},
                jsonls = {},
                tsserver = {},
                pyright = {},
                ruff_lsp = {
                    init_options = {
                        organizeImports = true,
                        fixAll = true,
                    },
                    commands = {
                        RuffAutofix = {
                            function()
                                vim.lsp.buf.execute_command({
                                    command = "ruff.applyAutofix",
                                    arguments = {
                                        { uri = vim.uri_from_bufnr(0) },
                                    },
                                })
                            end,
                            description = "Ruff: Fix all auto-fixable problems",
                        },
                        RuffOrganizeImports = {
                            function()
                                vim.lsp.buf.execute_command({
                                    command = "ruff.applyOrganizeImports",
                                    arguments = {
                                        { uri = vim.uri_from_bufnr(0) },
                                    },
                                })
                            end,
                            description = "Ruff: Format imports",
                        },
                    },
                },
                lemminx = {},
                yamlls = {},
                zls = {},
                --rome = {
                --    settings = {
                --        formatter = {
                --            enabled = true,
                --            indentStyle = "tab",
                --            indentSize = 8
                --        }
                --    }
                --}
            },
            setup = {},
        },
        config = function(_, opts)
            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            local navic = function(client, buf)
                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, buf)
                end
            end

            local on_attach = function(client, buf)
                navic(client, buf)

                if client.name == 'tsserver' then
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end

                if client.name == 'ruff_lsp' then
                    client.server_capabilities.hoverProvider = false
                end
            end

            local ensure_installed = {}
            local n = 0
            for key, _ in pairs(servers) do
                -- Ignore mason rust_analyzer and use system
                if key == "rust_analyzer" or key == "ruff_lsp" or key == "pyright" then
                    goto continue
                end

                ensure_installed[n] = key
                n = n + 1

                ::continue::
            end

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
            })
            require("mason-lspconfig").setup_handlers({
                function(server)
                    local server_opts = servers[server] or {}

                    server_opts.capabilities = capabilities

                    server_opts.on_attach = on_attach

                    if opts.setup[server] then
                        if opts.setup[server](server, server_opts) then
                            return
                        end
                    elseif opts.setup["*"] then
                        if opts.setup["*"](server, server_opts) then
                            return
                        end
                    end

                    require("lspconfig")[server].setup(server_opts)
                end
            })

            -- Need to install https://github.com/svenstaro/glsl-language-server manually
            require("lspconfig").glslls.setup({
                capabilities = capabilities,
                cmd = { "glslls", "--stdin" },
                filetypes = { "glsl" },
            })

            require("lspconfig").ruff_lsp.setup({
                capabilities = capabilities,
                cmd = { "ruff-lsp" },
                filetypes = { "python" }
            })

            require("lspconfig").pyright.setup({
                capabilities = capabilities,
                cmd = { 'pyright-langserver', '--stdio' },
                filetypes = { "python" }
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        cmd = {
            "Mason"
        }
    },
    {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup({})
        end
    },
    {
        "bekaboo/dropbar.nvim",
        enabled = false,
        config = function()
            require("bekaboo/dropbar.nvim").setup()
        end
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = 'neovim/nvim-lspconfig',
        opts = {
            separator = " > ",
            highlight = true,
            icons = {
                File = '',
                Module = '',
                Namespace = '',
                Package = '',
                Class = '',
                Method = '',
                Property = '',
                Field = '',
                Constructor = '',
                Enum = '',
                Interface = '',
                Function = '',
                Variable = '',
                Constant = '',
                String = '',
                Number = '',
                Boolean = '',
                Array = '',
                Object = '',
                Key = '',
                Null = '',
                EnumMember = '',
                Struct = '',
                Event = '',
                Operator = '',
                TypeParameter = '',
            }
        },
    },
    {
        "dnlhc/glance.nvim",
        cmd = "Glance"
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "rouge8/neotest-rust"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-rust")({
                        args = {
                            "--hide-progress-bar",
                            "--no-capture"
                        }
                    })
                }
            })
        end,
        keys = {
            {
                "<leader>ta",
                function()
                    require('neotest').run.run(vim.fn.getcwd())
                end,
                mode = { "n" },
                desc = "Run all tests in the current working directory"
            },
            {
                "<leader>tn",
                function()
                    require('neotest').run.run()
                end,
                mode = { "n" },
                desc = "Run test near cursor"
            },
            {
                "<leader>tl",
                function()
                    require('neotest').run.run_last()
                end,
                mode = { "n" },
                desc = "Run last ran test"
            },
            {
                "<leader>to",
                function()
                    require('neotest').output.open()
                end,
                mode = { "n" },
                desc = "Open the test output"
            },
            {
                "<leader>top",
                function()
                    require('neotest').output_panel.toggle()
                end,
                mode = { "n" },
                desc = "Toggle the test output panel"
            },
            {
                "<leader>tos",
                function()
                    require('neotest').summary.toggle()
                end,
                mode = { "n" },
                desc = "Toggle the test summary panel"
            },
        },
    },
    {
        "folke/neodev.nvim",
        opts = {},
    }
}
