return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "saghen/blink.cmp",
            "SmiteshP/nvim-navic"
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
                            completion = { callSnippet = "Replace" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true)
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
                            checkOnSave = true,
                            check = {
                                command = "clippy",
                                extraArgs = { "--no-deps" }
                            },
                            imports = {
                                granularity = {
                                    group = "item"
                                }
                            }
                        }
                    }
                },
                pyright = {
                    openFilesOnly = false,
                    analysis = {
                        autoImportCompletions = true,
                        diagnosticsMode = "workspace",
                        typeCheckingMode = "strict",
                    },
                },
                ruff = {
                    init_options = {
                        settings = {
                            organizeImports = true,
                            fixAll = true,
                            showSyntaxErrors = true,
                            lint = {
                                enable = true,
                            },
                            format = {
                                ["quote-style"] = "double"
                            },
                        }
                    }
                },
                ty = {
                    init_options = {
                        settings = {},
                    },
                },
                biome = {},
            },
        },
        config = function(_, opts)
            local navic = function(client, buf)
                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, buf)
                end
            end

            local on_attach = function(client, buf)
                navic(client, buf)

                if client.name == "ruff" then
                    client.server_capabilities.hoverProvider = false
                end

                -- vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
                -- vim.keymap.set("n", "<leader>dd", vim.lsp.buf.definition)
                -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
            end

            -- diagnostic configuration
            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("*", {
                on_attach = on_attach,
                capabilities = capabilities
            })

            for server, server_opts in pairs(servers) do
                vim.lsp.config(server, server_opts)
                vim.lsp.enable(server)
            end
        end
    },
    {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup({})
        end
    },
}
