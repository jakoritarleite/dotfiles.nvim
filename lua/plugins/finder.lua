return {
    "dmtrKovalenko/fff.nvim",
    build = "cargo +nightly build --release",
    opts = {
        width = 0.9,
        height = 0.9,
        prompt = "🐈‍⬛ ",
        keymaps = {
            -- select_split = "",
            -- select_vsplit = "",
        },
        icons = { enabled = false }
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("fff").find_files()
            end,
            desc = "Find files"
        },
        {
            "<leader>gf",
            function()
                require("fff").find_in_git_root()
            end,
            desc = "Find files in Git root"
        },
    }
}
