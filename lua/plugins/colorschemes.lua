return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.g.gruvbox_material_background = 'soft'
            vim.g.gruvbox_material_foreground = 'mix'
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_dim_inactive_windows = 0
            vim.g.gruvbox_material_better_performance = 0

            vim.cmd([[colorscheme gruvbox-material]])
        end
    },
    -- {
    --     "daschw/leaf.nvim",
    --     lazy = true,
    --     config = function()
    --         return {
    --             undercurl = false,
    --             commentStyle = false,
    --             functionStyle = false,
    --             keywordStyle = false,
    --             statementStyle = false,
    --             typeStyle = false,
    --             variablebuiltinStyle = false,
    --             transparent = true,
    --             theme = "dark",
    --             overrides = {
    --                 LineNr = { fg = "#444444" }
    --             }
    --         }
    --     end
    -- }
}
