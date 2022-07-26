-- [[ Settings ]]

local TABSIZE = 4
local MINSCROLL_V = 4
local MINSCROLL_H = 4

local set = vim.opt

set.autoindent = true           -- good auto indent
set.backup = false              -- create a backup file
set.clipboard = "unnamedplus"   -- use system clipboard
set.cmdheight = 1               -- command line height
set.cursorline = true           -- highlight current line
set.conceallevel = 0            -- so that `` is visible in markdown files
set.encoding = "utf-8"          -- encoding displayed
set.fileencoding = "utf-8"      -- encoding written to a file
set.filetype = "on"             -- detect file type
set.hlsearch = true             -- highlight matches when searching
set.ignorecase = true           -- ignore case in search patterns
set.mouse = 'a'                 -- mouse support for all modes
set.pumheight = 10              -- pop up menu height
set.number = true               -- display line numbers
set.relativenumber = false      -- disable relative numbers
set.signcolumn = "yes:1"        -- always show sign column, width 1 char
set.showmode = false            -- don't display editing mode
set.showtabline = 1             -- show tabline only when at least 2 tabs are open
set.smartindent = true
set.smarttab = true
set.splitbelow = true           -- horizontal split below by default
set.splitright = true           -- vertical split right by default
set.swapfile = false            -- create swapfile
set.scrolloff = MINSCROLL_V
set.sidescrolloff = MINSCROLL_H

set.shiftwidth = TABSIZE        -- autoindent distance
set.softtabstop = TABSIZE
set.expandtab = true            -- convert tabs to spaces
set.tabstop = TABSIZE

set.termguicolors = true        -- enable a wider range of colors
set.timeoutlen = 400            -- max delay in between keystrokes of mapped sequences (milliseconds)
set.updatetime = 300            -- autocomplete delay (4000ms default)
set.iskeyword:append('-')       -- treat dash-separated words as a unit
set.wrap = false                -- do not wrap long lines
set.guifont = "monospace:h17"   -- font used in graphical neovim apps
