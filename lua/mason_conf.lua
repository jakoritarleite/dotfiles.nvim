require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd", "cmake", "dockerls", "eslint", "gopls", "jsonls", "tsserver", "pyright", "lemminx", "yamlls" }
})
