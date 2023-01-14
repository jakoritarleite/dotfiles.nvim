return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip"
        },
        opts = {
            diagnostics = {
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
                lemmix = {},
                yamlls = {}
            }
        },
        config = function(plugin, opts)
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
