return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim"
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files"
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Find in files"
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Buffers"
        },
        {
            "<leader>pv",
            function()
                require("telescope").extensions.file_browser.file_browser()
            end,
            desc = "File explorer"
        }
    },
    opts = {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
        },
        pickers = {
            find_files = {
                theme = "ivy"
            },
            live_grep = {
                theme = "ivy",
            },
            buffers = {
                theme = "ivy"
            }
        },
        extensions = {
            file_browser = {
                theme = "ivy",
            }
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("file_browser")
    end
}
