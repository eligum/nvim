--[[

Neovim init file
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require("packer_init")
require("core.settings")
require("core.keymaps")
require("core.autocmds")
require("core.colors")

require("plugins.cmp")
-- require("user.lsp")
-- require("user.telescope")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.comment")
require("user.nvimtree")
