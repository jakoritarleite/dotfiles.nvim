vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer needs itself
    use 'wbthomason/packer.nvim'

    -- colorschemas
    -- use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}
    -- 'kvrohit/rasmus.nvim'
    -- use 'daschw/leaf.nvim'
    use 'sainnhe/gruvbox-material'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

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
    use 'nvim-treesitter/nvim-treesitter-context'

    -- fuzzy find
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- git
    use 'tpope/vim-fugitive'

    -- utils
    -- use 'karb94/neoscroll.nvim'

    -- markdown preview
    use 'ellisonleao/glow.nvim'

    -- focus
    use 'folke/zen-mode.nvim'
end)
