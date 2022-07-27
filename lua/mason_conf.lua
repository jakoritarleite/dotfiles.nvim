require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "ccls", "cmake", "dockerls", "gopls", "jsonls", "tsserver", "pyright", "lemminx", "yamlls" }
})
