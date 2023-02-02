return {
    {
        "goolord/alpha-nvim",
        disable = true,
    },
    {
        "echasnovski/mini.starter",
        dependencies = {
            "mini.sessions"
        },
        event = "VimEnter",
        opts = function()
            local logo = table.concat({
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }, "\n")
            local new_section = function(name, action, section)
                return { name = name, action = action, section = section }
            end

            local starter = require("mini.starter")
            local config = {
                evaluate_single = true,
                header = logo,
                items = {
                    starter.sections.sessions(20, true),
                    new_section("Find file",    "Telescope find_files", "Telescope"),
                    new_section("Recent files", "Telescope oldfiles",   "Telescope"),
                    new_section("Grep text",    "Telescope live_grep",  "Telescope"),
                    new_section("init.lua",     "e $MYVIMRC",           "Config"),
                    new_section("Lazy",         "Lazy",                 "Config"),
                    new_section("New file",     "ene | startinsert",    "Built-in"),
                    new_section("Quit",         "qa",                   "Built-in"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet("░ ", false),
                    starter.gen_hook.aligning("center", "center")
                }
            }
            return config
        end,
        config = function(_, config)
            -- close Lazy and re-open when starter is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "MiniStarterOpened",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            local starter = require("mini.starter")
            starter.setup(config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 8)
                    starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(starter.refresh)
                end,
            })
        end,
    },
    {
        "echasnovski/mini.sessions",
        version = false,
        opts = {
            -- Whether to read latest session if Neovim opened without file arguments
            autoread = false,
            -- Whether to write current session before quitting Neovim
            autowrite = true,
            -- Directory where global sessions are stored (use `''` to disable)
            directory =  '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
            -- File for local session (use `''` to disable)
            file = '' -- 'Session.vim',
        },
        config = function(opts, _)
            require("mini.sessions").setup(opts)
        end
    },
}
