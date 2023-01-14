return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            diagnostics = {
                virtual_text = true,
                signs = false,
                underline = true,
                update_in_insert = false,
            },
            servers = {
                sumneko_lua = {},
                rust_analyzer = {
                    diagnostics = {
                        disabled = { "unresolved-proc-macro" }
                    },
                    cargo = { allFeatures = true },
                    checkOnSave = {
                        command = "clippy",
                        extraArgs = { "--no-deps" },
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
                lemminx = {},
                yamlls = {}
            },
            setup = {},
        },
        config = function(_, opts)
            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
            require("mason-lspconfig").setup_handlers({
                function(server)
                    local server_opts = servers[server] or {}

                    server_opts.capabilities = capabilities

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
        end
    }
}
