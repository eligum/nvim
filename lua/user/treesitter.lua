local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "bash", "make", "python", "comment",
        "c", "cpp", "cmake", "rust", "c_sharp", "lua", "go",
        "css", "scss", "html", "javascript", "typescript",
        "http", "json", "jsdoc", "json5", "toml", "yaml",
        "sql", "glsl", "wgsl", "vue",
    },
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true,       -- false will disable the whole extension
        disable = { "" },    -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "yaml", "python", "css" } },
})
