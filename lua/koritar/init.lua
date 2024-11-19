_G.koritar = {}

local augroup = vim.api.nvim_create_augroup
local KoritarGroup = augroup("KoritarGroup", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("BufWritePre", {
    group = KoritarGroup,
    pattern = "*",
    command = "lua vim.lsp.buf.format()",
})

function swallow_output(callback, ...)
    local old_print = print
    print = function(...) end

    pcall(callback, arg)

    print = old_print
end

autocmd("BufWritePre", {
    group = KoritarGroup,
    pattern = "*.py",
    callback = function()
        swallow_output(function()
            local ruff = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf(), name = "ruff_lsp" })[1]
            ruff.request_sync("workspace/executeCommand", {
                command = 'ruff.applyAutofix',
                arguments = {
                    { uri = vim.uri_from_bufnr(0) },
                },
            }, 2000)
            ruff.request_sync("workspace/executeCommand", {
                command = 'ruff.applyOrganizeImports',
                arguments = {
                    { uri = vim.uri_from_bufnr(0) },
                },
            }, 2000)
        end)

        vim.lsp.buf.format()
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("koritar.util")
require("koritar.remap")

require("koritar.statusline")

-- require("koritar.winbar").init()
-- vim.opt.winbar = "%{%v:lua.require'koritar.winbar'.winbar()%}"

require("koritar.comby")
