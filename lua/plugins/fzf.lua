return {
    "ibhagwan/fzf-lua",
    opts = {
        fzf_opts = {
            ["--layout"] = "reverse-list",
        },
        winopts = {
            width = 0.9,
            height = 0.9,
            border = "single",
            backdrop = 100,
        },
        grep = {
            git_icons = false,
            file_icons = false,
            color_icons = false,
            rg_glob = true,
        },
        diagnostics = {
            diag_icons = false,
            diag_source = false,
            diag_code = false,
            multiline = 1,
        },
        buffers = {
            file_icons = false,
            color_icons = false,
        }
    },
    keys = {
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "live grep current directory"
        },
        {
            "<leader>fs",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            desc = "show lsp symbols in current buffer"
        },
        {
            "<leader>fd",
            function()
                require("fzf-lua").diagnostics_workspace()
            end,
            desc = "show lsp diagnostics"
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "show open buffers"
        }
    },
}
