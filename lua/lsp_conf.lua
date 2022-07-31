local lspconfig = require("lspconfig")

-- installed servers:
-- "sumneko_lua", "rust_analyzer", "ccls", "cmake", "dockerls", "gopls", "jsonls", "pyright", "lemminx", "yamlls"

-- lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.ccls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.cmake.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.dockerls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.gopls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.lemminx.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.yamlls.setup(coq.lsp_ensure_capabilities({}))

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = true,
        signs = false,
        update_in_insert = false,
    }
)
