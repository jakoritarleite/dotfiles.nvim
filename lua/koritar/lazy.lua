require("lazy").setup("plugins", {
    defaults = { lazy = true },
    install = {
        missing = true,
        -- colorscheme = { "gruvbox-material" }
    },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        }
    },
    debug = false
})
