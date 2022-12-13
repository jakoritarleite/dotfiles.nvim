require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cmake", "cpp", "fish", "go", "json", "javascript", "json5", "lua", "make", "python", "rust", "toml", "typescript", "yaml" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
        },
    },
    context_commentstring = {
        enable = true,
    },
})
