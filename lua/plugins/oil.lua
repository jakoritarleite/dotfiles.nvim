return {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = false,
        keymaps = {
            ["yp"] = {
                callback = function()
                    require("oil.actions").copy_entry_path.callback()
                    vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
                    vim.notify("Copied full path", "info", { title = "Oil" })
                end,
                desc = "copy filepath to system clipboard"
            }
        }
    },
    keys = {
        {
            "<leader>pv",
            "<cmd>Oil<CR>",
            silent = true,
            desc = "opens oil",
        }
    }
}
