return {
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
        lazy = false,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local navic = require("nvim-navic")

            local winbar = {
                lualine_c = {
                    { "filename", path = 1, color = { fg = "#6e7681", bg = "NONE" }, padding = { right = -1 } },
                    {
                        function()
                            local location = navic.get_location()

                            if location ~= "" then
                                return "> " .. location
                            end

                            return location
                        end,
                        cond = function()
                            return navic.is_available()
                        end,
                        color = { bg = "NONE" }
                    }
                }
            }

            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_enabled = false,
                    section_separators = "",
                    component_separators = "",
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                    }
                },
                -- sections = {
                --     lualine_a = { "mode" },
                --     lualine_b = { "branch" },
                --     lualine_c = {
                --         {
                --             "filename",
                --             path = 0,
                --         },
                --         {
                --             "diagnostics",
                --         }
                --     },
                --     lualine_x = {
                --         {
                --             "filetype",
                --             padding = { left = 1, right = 1 },
                --         }
                --     },
                --     lualine_y = {},
                --     lualine_z = { "location" },
                -- },
                sections = {},
                tabline = {},
                winbar = winbar
                -- extensions = { "lazy" },
            })
        end,
    }
}
