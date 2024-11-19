local M = {}

function M.setup()
    vim.o.autoread = true
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
        command = "if mode() != 'c' | checktime | endif",
        pattern = { "*" },
    })
end

-- function M.Comby(pattern, replace)
function M.Comby(old)
    local old = vim.fn.expand("<cword>")

    local _, line_start, column_start, _ = unpack(vim.fn.getpos("'<"))
    if line_start ~= 0 and column_start ~= 0 then
        local _, line_end, column_end, _ = unpack(vim.fn.getpos("'>"))
        local lines = vim.fn.getline(line_start, line_end)

        if lines and #lines > 0 then
            lines[#lines] = string.sub(lines[#lines], 1, column_end) -- [:column_end - 2]
            lines[1] = string.sub(lines[1], column_start, -1)        -- [column_start - 1:]

            old = vim.fn.join(lines, "\n")
        end
    end

    local pattern = vim.fn.input("match template: ", old)
    local replace = vim.fn.input("rewrite templace: ", pattern)

    local w = math.floor(vim.api.nvim_get_option("columns") * 0.6)
    local cmd = string.format(
        [[export FZF_DEFAULT_OPTS='--height 90%% --layout=reverse --border --multi --bind=ctrl-a:toggle-all';export FZF_PREVIEW_COLUMNS=%d;export FZF_PREVIEW_LINES=33;]],
        w
    )

    cmd = cmd
        .. "fd"
        .. " "
        .. [[ | comby ]]
        .. "-matcher ."
        .. vim.fn.expand("%:e")
        .. " '"
        .. pattern
        .. "' '"
        .. replace
        .. "'"
        .. " -in-place"
        .. " -exclude-dir target,node_modules"

    -- print(cmd)

    vim.api.nvim_create_autocmd({ 'FileChangedShell', 'FocusGained', 'WinEnter', 'CursorHold' }, {
        group = vim.api.nvim_create_augroup('AuGroup', {}),
        callback = function()
            vim.cmd('checktime')
        end,
        once = true,
        buffer = vim.api.nvim_get_current_buf(),
    })

    vim.fn.system(cmd)
    vim.cmd('checktime')

    --require("lazy.util").float_cmd(
    --    { '"' .. cmd .. '"' },
    --    {
    --        cwd = require("koritar.util").get_root()
    --    }
    --)
end

vim.cmd([[command! -nargs=* Comby lua require("koritar.comby").Comby(<f-args>)]])
vim.cmd([[cnoreabbrev comby Comby]])

M.setup()

return M
