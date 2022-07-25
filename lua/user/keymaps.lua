local opts      = { silent = true, noremap = true }
local cmd_opts  = { silent = false, noremap = true }
--local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Set SPACE as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- n = normal_mode
-- i = insert_mode
-- v = visual_mode
-- x = visual_block_mode
-- t = term_mode
-- c = command_mode

-- Global search and replace
keymap('n', "<S-s>", ":%s//g<Left><Left>", cmd_opts)

-- Make vim even easier to exit ;) 'x' save and quit, 'q' quit without saving
keymap('n', "<Leader>x",  ":x<CR>",  opts)
keymap('n', "<Leader>q",  ":q!<CR>", opts)
keymap('n', "<Leader>fs", ":w<CR>",  opts)

-- Delete line without saving it to a register
keymap('n', "<C-k>",  [["_dd]], opts)

-- Toggle explorer
keymap('n', "<Leader>E", ":NvimTreeToggle<CR>", opts)
keymap('n', "<Leader>0", ":NvimTreeFocus<CR>",  opts)

-- Comfortable window related settings
keymap('n', "<C-Up>",    ":resize +2<CR>",          opts)
keymap('n', "<C-Down>",  ":resize -2<CR>",          opts)
keymap('n', "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap('n', "<C-Right>", ":vertical resize +2<CR>", opts)

keymap('n', "<Leader>w",  "<C-w>",  opts)

-- Navigate buffers
keymap('n', "<Leader>bn", ":bnext<CR>",     opts)
keymap('n', "<Leader>bp", ":bprevious<CR>", opts)
keymap('n', "<Leader>bd", ":bdelete<CR>",   opts)

-- Clear highlight search
keymap('n', "<C-l>", ":nohl<CR>:echo 'cleared'<CR>", opts)

-- Select whole buffer
keymap('n', "<C-a>", "ggVG", opts)

-- Convert inner word to uppercase
keymap('n', "<M-u>", "viwUe",      opts)
keymap('i', "<M-u>", "<Esc>viwUe", opts)

-- Exit insert mode with "fd"
keymap('i', "fd", "<ESC>", opts)

-- Keep selected area after indent command
keymap('v', "<", "<gv", opts)
keymap('v', ">", ">gv", opts)

-- Move selected text up and down
keymap('v', "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap('v', "<S-k>", ":move '<-2<CR>gv-gv", opts)
keymap('v', "p",     '"_dP',                opts)

-- Telescope key bindings
keymap('n', "<leader>ff", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap('n', "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
keymap('n', "<leader>ss", ":Telescope live_grep<CR>", opts)
