return {
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = {
            {
                "<leader>gg",
                "<cmd>Git<CR>",
                desc = "opens git status"
            },
            {
                "<leader>gd",
                "<cmd>Gdiff<CR>",
                desc = "opens diff of current buffer"
            },
            {
                "<leader>gl",
                "<cmd>Git log<CR>",
                desc = "opens log"
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
        },
    }
}
