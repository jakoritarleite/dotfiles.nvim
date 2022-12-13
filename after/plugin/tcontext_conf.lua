require('treesitter-context').setup {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
        },
        rust = {
            'impl_item',
            'function'
        }
    }
}
