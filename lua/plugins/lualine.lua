return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                icons_enabled = false,
                section_separators = '',
                component_separators = '',
                theme = 'gruvbox-material',
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch'},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {'diff', 'diagnostics'},
                lualine_c = {'encoding', 'fileformat'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
        }
    }
}
