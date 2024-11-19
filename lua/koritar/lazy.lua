require("lazy").setup("plugins", {
    defaults = { lazy = true },
    install = {
        missing = true,
        -- colorscheme = { "moonbow" }
    },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin", -- replaced by telescope file_browser
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        }
    },
    debug = false
})
