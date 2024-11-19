return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufReadPost",
        opts = {
            auto_install = false,
            sync_install = false,
            highlight = { enable = true },
            indent = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true
                }
            },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = {
                "c",
                "cmake",
                "cpp",
                "fish",
                "go",
                "glsl",
                "json",
                "javascript",
                "json5",
                "lua",
                "make",
                "python",
                "rust",
                "toml",
                "typescript",
                "yaml"
            }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
            max_lines = 0,
            trim_scope = "outer",
            patterns = {
                default = {
                    "class",
                    "function",
                    "method"
                },
                rust = {
                    "impl_item",
                    "function"
                }
            }
        },
    }
}
