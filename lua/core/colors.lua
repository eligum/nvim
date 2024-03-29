-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local colorscheme = "gruvbox"

-- Monokaipro settings
--vim.g.monokaipro_filter = "machine"
vim.g.monokaipro_italic_functions = true
vim.g.monokaipro_sidebars = { "vista_kind", "packer" }
vim.g.monokaipro_flat_term = true
vim.g.monokaipro_colors = { hint = "orange", error = "#ff0000" }

-- Gruvbox settings
if colorscheme == "gruvbox" then
    vim.o.background = "dark"
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            comments = true,
            operators = false,
            folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        overrides = {},
    })
end

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not available!")
    return
end
