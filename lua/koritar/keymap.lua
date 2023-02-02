local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
        
    return function(lhs, rhs, opts)
        local keys = require("lazy.core.handler").handlers.keys

        ---@cast keys LazyKeysHandler
        -- do not create the keymap if a lazy keys handler exists
        if not keys.active[keys.parse({ lhs, mode = op }).id] then
            opts = vim.tbl_extend("force",
                outer_opts,
                opts or {}
            )
            vim.keymap.set(op, lhs, rhs, opts)
        end
    end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

return M
