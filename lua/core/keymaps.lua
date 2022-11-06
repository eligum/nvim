--------------------------------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
--------------------------------------------------------------------------------

local function keymap(mode, lhs, rhs)
    local options = { silent = true, noremap = true }
    if opts then
        options = vim.tbl_extend("force", options)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Set SPACE as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
-- n = normal_mode
-- i = insert_mode
-- v = visual_mode
-- x = visual_block_mode
-- t = term_mode
-- c = command_mode

--------------------------------------------------------------------------------
-- Neovim shortcuts
--------------------------------------------------------------------------------

-- Global search and replace
keymap('n', "<S-s>", ":%s//g<Left><Left>", { silent = false })

-- Exit vim, 'x' save and quit, 'q' quit without saving
keymap('n', "<Leader>x",  ":xa<CR>")
keymap('n', "<Leader>q",  ":qa!<CR>")

-- Save current file
keymap('n', "<Leader>fs", ":w<CR>")
keymap('n', "<C-s>",      ":w<CR>")

-- Exit insert mode with "fd"
keymap('i', "fd", "<ESC>")

-- Clear highlight search
keymap('n', "<C-l>", ":nohl<CR>:echo 'cleared'<CR>")

-- Select whole buffer
keymap('n', "<C-a>", "ggVG")

-- Convert inner word to uppercase
keymap('n', "<M-u>", "viwUe")
keymap('i', "<M-u>", "<Esc>viwUe")

-- Delete line without saving it to a register
keymap('n', "<C-k>",  [["_dd]])

-- Comfortable window related settings
keymap('n', "<C-Up>",   ":resize +2<CR>")
keymap('n', "<C-Down>", ":resize -2<CR>")
keymap('n', "<A-S-k>",  ":vertical resize +2<CR>")
keymap('n', "<A-S-j>",  ":vertical resize -2<CR>")

keymap('n', "<Leader>w",  "<C-w>")

-- Quick editing of neovim config files
keymap('n', "<Leader>sv", ":luafile $MYVIMRC<CR>")
keymap('n', "<Leader>ei", ":e $MYVIMRC<CR>")
keymap('n', "<Leader>ek", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>")
keymap('n', "<Leader>es", ":e ~/.config/nvim/lua/core/settings.lua<CR>")
keymap('n', "<Leader>ep", ":e ~/.config/nvim/lua/core/plugins.lua<CR>")
keymap('n', "<Leader>ec", ":e ~/.config/nvim/lua/core/colors.lua<CR>")

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>")
keymap('n', "<S-h>", ":bprevious<CR>")
keymap('n', "<Leader>bd", ":bdelete<CR>")

-- Keep selected area after indent command
keymap('v', "<", "<gv")
keymap('v', ">", ">gv")

-- Move selected text up and down
keymap('v', "<A-j>", ":move '>+1<CR>gv-gv")
keymap('v', "<A-k>", ":move '<-2<CR>gv-gv")
keymap('v', "p",     '"_dP')

keymap('n', "<A-j>", "V:move '>+1<CR>gv-gv<ESC>")
keymap('n', "<A-k>", "V:move '<-2<CR>gv-gv<ESC>")
keymap('i', "<A-j>", "<ESC>V:move '>+1<CR>gv-gv<ESC>i")
keymap('i', "<A-k>", "<ESC>V:move '<-2<CR>gv-gv<ESC>i")

--------------------------------------------------------------------------------
-- Applications and Plugins shortcuts
--------------------------------------------------------------------------------

-- Toggle explorer
keymap('n', "<Leader>E", ":NvimTreeToggle<CR>")
keymap('n', "<Leader>0", ":NvimTreeFocus<CR>")

-- Telescope key bindings
keymap('n', "<leader>ff", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")
keymap('n', "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
keymap('n', "<leader>ss", ":Telescope live_grep<CR>")
