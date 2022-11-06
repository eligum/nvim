local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        'bash', 'c', 'cpp', 'cmake', 'css', 'glsl', 'go', 'html', 'javascript', 'json',
        'lua', 'make', 'python', 'rust', 'typescript', 'sql', 'rust', 'vim', 'toml', 'yaml',
    },
    ignore_install = { 'rust' }, -- list of parsers to ignore installing
    highlight = {
        enable = true,       -- false will disable the whole extension
        disable = { '' },    -- list of language that will be disabled
    },
    -- autopairs = {
    --     enable = true,
    -- },
    -- indent = { enable = true, disable = { 'yaml', 'python', 'css' } },
})
