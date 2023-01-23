return {
    "nvim-lua/plenary.nvim",
    {
        "ellisonleao/glow.nvim",
        cmd = "Glow"
    },
    "folke/zen-mode.nvim",
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
    }
}
