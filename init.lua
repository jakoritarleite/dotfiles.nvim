require("koritar.set")

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path
    }
end

vim.opt.runtimepath:prepend(lazy_path)

require("koritar.lazy")

-- navic
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- set colorscheme right after lazy
-- vim.cmd [[colorscheme gruvbox-material]]

require("koritar")

-- vim.cmd [[autocmd BufRead *.rs :setlocal tags=./tags;/]]
-- vim.cmd [[autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --omit-deps --quiet --start-dir=" . expand('%:p:h') . "--output=tags &" | redraw!]]
