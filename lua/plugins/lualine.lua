local colors = {
    darkgray = "#16161d",
    gray = "#70788a",
    innerbg = "NONE",
    outerbg = "NONE",
    normal = "#141414",
    insert = "#ffffff",
    visual = "#ffffff",
    replace = "#ffffff",
    command = "#ffffff",
}

local theme = {
    inactive = {
        a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
        a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
        a = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
        a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
        a = { fg = colors.insert, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
        a = { fg = colors.command, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
}

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        },
        opts = {
            options = {
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "|", right = "|" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
                theme = theme,
            },
            -- sections = {
            --     lualine_a = {'mode'},
            --     lualine_b = {'branch'},
            --     lualine_c = {'filename'},
            --     lualine_x = {'filetype'},
            --     lualine_y = {'progress'},
            --     lualine_z = {'location'}
            -- },
            -- inactive_sections = {
            --     lualine_a = {},
            --     lualine_b = {'diff', 'diagnostics'},
            --     lualine_c = {'encoding', 'fileformat'},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    }
}
