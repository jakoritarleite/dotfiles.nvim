vim.opt.guicursor = ""

vim.opt.laststatus = 3

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.numberwidth = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.g.t_Co = 256

vim.opt.signcolumn = "yes"

-- vim.opt.scrolloff = 999

vim.opt.cmdheight = 1

vim.opt.sidescroll = 1

vim.g.mapleader = " "

if vim.g.neovide then
    vim.o.guifont = "ZedMono Nerd Font:h10"
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 144
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0.1
end

vim.cmd [[autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
