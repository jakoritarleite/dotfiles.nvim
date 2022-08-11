local nnoremap = require("keymap").nnoremap

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
