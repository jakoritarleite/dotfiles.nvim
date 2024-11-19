return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim"
    },
    cmd = "Telescope",
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
        },
        {
            "<leader>ftg",
            function()
                require("telescope.builtin").tags()
            end,
            desc = "Tags"
        },
        {
            "<leader>ft",
            function()
                require("telescope.builtin").treesitter()
            end,
            desc = "Treesitter Symbols"
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").lsp_document_symbols({
                    show_line = true,
                    symbols = {
                        "Class",
                        "Struct",
                        "Enum",
                        "Constant",
                        "Method",
                        "Property",
                        "Field",
                        "Interface",
                        "Function",
                        "EnumMember",
                        "TypeParameter"
                    }
                })
            end,
            desc = "LSP Symbols"
        },
        {
            "<leader>fi",
            function()
                require("telescope.builtin").lsp_implementations()
            end,
            desc = "LSP Implementations"
        },
        {
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "LSP Diagnostics"
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "LSP References"
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
            -- find_files = {
            --     theme = "ivy"
            -- },
            -- live_grep = {
            --     theme = "ivy",
            -- },
            -- oldfiles = {
            --     theme = "ivy",
            -- },
            -- buffers = {
            --     theme = "ivy"
            -- }
        },
        extensions = {
            file_browser = {
                -- theme = "ivy",
                path = "%:p:h"
            }
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("file_browser")

        --require("which-key").register()
        --require("which-key").register({
        --    ["<leader>f"] = {
        --        f = "Find File"
        --    }
        --})
    end
}
