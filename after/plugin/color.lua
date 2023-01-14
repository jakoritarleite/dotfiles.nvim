function colorme(colorscheme)
    colorscheme = colorscheme or "leaf"

    -- configure
    options[colorscheme]()
    vim.cmd.colorscheme(colorscheme)
end

-- set termguicolors
-- let g:gruvbox_contrast_dark='medium'
-- let g:gruvbox_contrast_light='hard'
-- colorscheme gruvbox
-- hi LspCxxHlGroupMemberVariable guifg=#83a598


options = {
    ['leaf'] = function()
        require('leaf').setup {
            undercurl = false,
            commentStyle = false,
            functionStyle = false,
            keywordStyle = false,
            statementStyle = false,
            typeStyle = false,
            variablebuiltinStyle = false,
            transparent = true,
            theme = "dark",
            overrides = {
                LineNr = { fg = "#444444" }
            }
        }
    end,
    ['gruvbox-material'] = function()
        vim.opt.background = 'dark'
        vim.g.gruvbox_material_background = 'soft'
        vim.g.gruvbox_material_foreground = 'mix'
        vim.g.gruvbox_material_transparent_background = 1
        vim.g.gruvbox_material_dim_inactive_windows = 0
        vim.g.gruvbox_material_better_performance = 0
    end
}

-- require("leaf").setup({
--     undercurl = false,
--     commentStyle = false,
--     functionStyle = false,
--     keywordStyle = false,
--     statementStyle = false,
--     typeStyle = false,
--     variablebuiltinStyle = false,
--     transparent = true,
--     theme = "dark",
--     overrides = {
--         LineNr = { fg = "#444444" }
--     }
-- })

-- vim.cmd [[colorscheme rasmus]]

-- vim.cmd("colorscheme leaf")

-- Changed in leaf setup at overrides
-- vim.cmd("highlight LineNr ctermfg=238")

colorme("gruvbox-material")
