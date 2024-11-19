return {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "ellisonleao/glow.nvim",
        cmd = "Glow"
    },
    {
        "folke/zen-mode.nvim",
        cmd = "Zen"
    },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dimiss({ silent = true, pending = true })
                end,
                desc = "Remove notifications"
            }
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end
        }
    },
    {
        "JellyApple102/flote.nvim",
        cmd = "Flote",
        config = function()
            require("flote").setup()
        end
    },
    --{
    --    "karb94/neoscroll.nvim",
    --    config = function()
    --        require('neoscroll').setup({
    --            mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    --                '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', },
    --            hide_cursor = true,          -- Hide cursor while scrolling
    --            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --            easing = 'linear',           -- Default easing function
    --            pre_hook = nil,              -- Function to run before the scrolling animation starts
    --            post_hook = nil,             -- Function to run after the scrolling animation ends
    --            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    --        })
    --    end
    --},
    --{
    --    "ggandor/leap.nvim",
    --    lazy = false,
    --    prority = 1000,
    --    dependencies = {
    --        "tpope/vim-repeat"
    --    },
    --    config = function()
    --        require('leap').add_default_mappings(true)
    --        require('leap').create_default_mappings()
    --    end
    --}
}
