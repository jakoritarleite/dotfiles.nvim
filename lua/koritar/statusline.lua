local M = {}
koritar.statusline = M

-- function LspStatus()
--     local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
--     local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
--
--     return '   ' .. errors .. '   ' .. warnings .. ' '
-- end

local function git_branch()
    local symbol = " 󰘬 "

    if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
        return ''
    end

    return table.concat {
        symbol,
        vim.b.gitsigns_status_dict.head
    }
end

local function filepath()
    local file_path = vim.fn.expand('%:~:.')

    return file_path
end

local function filetype()
    local file_type = vim.fn.expand('%:e')

    return file_type:gsub("^%l", string.upper)
end

local function fileencoding()
    local file_enconfig = ""

    if vim.o.fenc then
        file_enconfig = vim.o.fenc
    else
        file_enconfig = vim.o.enc
    end

    return string.upper(file_enconfig)
end

function M.Active()
    local spacing = "   "
    local align_right = "%="
    -- local filetype = " %Y"
    local file_encoding = "%{&fenc?&fenc:&enc}"
    local linecol = " %l:%c"

    return table.concat {
        filepath(),
        spacing,
        linecol,
        align_right,
        fileencoding(),
        spacing,
        filetype(),
        spacing,
        git_branch(),
        spacing,
    }
end

function M.Inactive()
    return "%#StatusLineNC#%f%*"
end

local StatusLineGroup = vim.api.nvim_create_augroup("MyStatusLine", {})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = StatusLineGroup,
    pattern = "*",
    callback = function()
        vim.opt_local.statusline = [[%!luaeval("koritar.statusline.Active()")]]
    end
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = StatusLineGroup,
    pattern = "*",
    callback = function()
        vim.opt_local.statusline = [[%!luaeval("koritar.statusline.Inactive()")]]
    end
})

-- vim.opt

-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#252829", fg = "#76787d" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#252829", fg = "#8d9096" })
