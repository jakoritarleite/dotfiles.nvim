local M = {}

local hl_winbar_path = 'WinBarPath'
local hl_winbar_file = 'WinBarFile'
local hl_winbar_symbols = 'WinBarSymbols'

-- local navic = require("nvim-navic")

local isempty = function(s)
    return s == nil or s == ''
end

function Filepath()
    local file_path = vim.fn.expand('%:~:.')

    return file_path
end

local _, navic = pcall(require, 'nvim-navic')
function WinbarNavic()
    local ok, navic_location = pcall(navic.get_location, {})
    local value = ''

    if ok and navic.is_available() and navic_location ~= 'error' and not isempty(navic_location) then
        -- value = '%#' .. hl_winbar_symbols .. '# ' .. '>' .. ' %*'
        -- value = value .. '%#' .. hl_winbar_symbols .. '#' .. navic_location .. '%*'
        value = value .. ' > ' .. navic_location .. '%*'
    end

    return value
end

M.winbar = function()
    local win_filepath = Filepath()
    local win_navic = WinbarNavic()

    return table.concat {
        win_filepath,
        win_navic,
    }
end

M.init = function()
    vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE", fg = "#6e7681" })
end

M.show = function()
    -- local winbar = WinBar()

    -- vim.api.nvim_set_option_value("winbar", winbar, { scope = "local" })

    -- local ok, _ = pcall(vim.api.nvim_set_option_value, 'winbar', winbar, { scope = 'local' })
    -- if not ok then
    --     return
    -- end
end

return M
