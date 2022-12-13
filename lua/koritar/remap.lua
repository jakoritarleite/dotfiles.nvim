local nnoremap = require("koritar.keymap").nnoremap
local vnoremap = require("koritar.keymap").vnoremap

-- open nvim explorer with Space P V
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- go to definition
nnoremap("<leader>dd", "<cmd>lua vim.lsp.buf.definition()<CR>")

-- show hover
nnoremap("<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- code actions
nnoremap("<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")

-- telescope
nnoremap("<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<cr>")

-- lsp
nnoremap("<leader>d", "<Cmd>lua vim.diagnostic.open_float()<CR>")

-- movements
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")

-- copy clipboard :)
nnoremap("<leader>Y", "\"+Y")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
