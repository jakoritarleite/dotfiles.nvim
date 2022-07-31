local lspconfig = require 'lspconfig'
local cmp = require 'cmp'

-- local lua51 = require 'lua51'
-- local lua51 = require 'lua51'

cmp.setup({
    snippet = {
         expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Down>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Enter>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
        {
            {
                name = 'nvim_lsp'
            },
            {
                name = 'vsnip'
            }
        },
        {
            {
                name = 'buffer'
            }
        }
    )
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{
        name = 'buffer'
    }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }})
})

local python_root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- "sumneko_lua", "rust_analyzer", "ccls", "cmake", "dockerls", "gopls", "jsonls", "pyright", "lemminx", "yamlls".
require('lspconfig')['sumneko_lua'].setup { capabilities = capabilities }
require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
require('lspconfig')['ccls'].setup { capabilities = capabilities }
require('lspconfig')['cmake'].setup { capabilities = capabilities }
require('lspconfig')['dockerls'].setup { capabilities = capabilities }
require('lspconfig')['gopls'].setup { capabilities = capabilities }
require('lspconfig')['jsonls'].setup { capabilities = capabilities }
require('lspconfig')['pyright'].setup { capabilities = capabilities, root_dir = lspconfig.util.root_pattern(unpack(python_root_files)) }
require('lspconfig')['lemminx'].setup { capabilities = capabilities }
require('lspconfig')['yamlls'].setup { capabilities = capabilities}