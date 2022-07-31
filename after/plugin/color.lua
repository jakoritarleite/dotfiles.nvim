require("leaf").setup({
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
})

vim.cmd("colorscheme leaf")

-- Changed in leaf setup at overrides
-- vim.cmd("highlight LineNr ctermfg=238")
