vim.cmd [[packadd packer.nvim]]
 
return require('packer').startup(function(use)
    -- Packer needs itself
    use 'wbthomason/packer.nvim'

    -- colorschemas
    use 'cocopon/iceberg.vim'
    use 'romainl/Apprentice'

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- treesitter / highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }

    -- utils
    use 'sumneko/lua-fuck-5.1'
end)
