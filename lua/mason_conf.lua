require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "ccls", "cmake", "dockerls", "eslint-lsp", "gopls", "jsonls", "tsserver", "pyright", "lemminx", "yamlls" }
})
