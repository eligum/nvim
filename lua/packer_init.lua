--------------------------------------------------------------------------------
-- Plugin manager configuration file
--------------------------------------------------------------------------------

-- Plugin manager: packer.nvim
-- URL: https://github.com/wbthomason/packer.nvim

-- Automatically install packer
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Requires git to be available on the system
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print "Installing Packer.nvim..."
    execute 'packadd packer.nvim'
end

-- Autocommand to reload neovim whenever this file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer_init.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
return packer.startup(function(use)

    -- Essential
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/popup.nvim" }    -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins
    use { "nvim-treesitter/nvim-treesitter" } --, run = ":TSUpdate" }
    use { "windwp/nvim-autopairs" }  -- Autopairs, integrates with cmp and tree
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-tree.lua" }
    use { "kyazdani42/nvim-web-devicons" } -- Optional, for file icons

    -- Colorschemes
    use { "lunarvim/darkplus.nvim" } -- VSCode dark theme
    use { "ellisonleao/gruvbox.nvim" }
    use { "https://gitlab.com/__tpb/monokai-pro.nvim" }

    -- CMP plugins
    use { "hrsh7th/nvim-cmp" }       -- The completion plugin
    use { "hrsh7th/cmp-buffer" }     -- Buffer completions
    use { "hrsh7th/cmp-path" }       -- Path completions
    use { "hrsh7th/cmp-cmdline" }    -- Cmdline completions
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    -- LSP
    use { "neovim/nvim-lspconfig" }  -- Core LSP support from neovim
    use { "williamboman/nvim-lsp-installer" } -- Simple language server installer

    -- Snippets
    use { "L3MON4D3/LuaSnip" }       -- Snippet engine
    use { "rafamadriz/friendly-snippets" } -- A bunch of useful snippets

    -- Fuzzy-finder
    use { "nvim-telescope/telescope.nvim" }

    -- Automatically set up your config after fresh start
    -- Put this after all your plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
