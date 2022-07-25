--------------------------------------------------------------------------------
-- Packer.nvim -----------------------------------------------------------------
--------------------------------------------------------------------------------

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Requires git to be available on the system
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", 
        "clone", 
        "https://github.com/wbthomason/packer.nvim", 
        install_path
    })
    print "Installing Packer.nvim..."
	execute 'packadd packer.nvim'
end

-- Autocommand to reload neovim whenever this file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
    return
end

-- Install your plugins here
return packer.startup(function(use)

    -- Essential
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/popup.nvim" }    -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins

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

    -- LSP
    use { "neovim/nvim-lspconfig" }  -- Core LSP support from neovim
    use { "williamboman/nvim-lsp-installer" } -- Simple language server installer

    -- Snippets
    use { "L3MON4D3/LuaSnip" }       -- Snippet engine
    use { "rafamadriz/friendly-snippets" } -- A bunch of useful snippets

    -- A collection of common configurations for Neovim's built-in language server client
	--use { 'neovim/nvim-lspconfig',
	--      config = [[ require('plugins/lspconfig') ]] }

	--use { 'williamboman/nvim-lsp-installer',
	--	config = [[ require('plugins/lsp_installer_nvim') ]] }

    ---- vscode-like pictograms for neovim lsp completion items Topics
	--use { 'onsails/lspkind-nvim',
	--	  config = [[ require('plugins/lspkind') ]] }

    ---- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in Neovim statusline
	--use { 'nvim-lua/lsp-status.nvim',
	--	  config = [[ require('plugins/lspstatus') ]] }

    --end, config = {
    --    -- Move to lua dir so impatient.nvim can cache it
    --    compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
    --}

    -- Automatically set up your config after fresh start
    -- Put this after all your plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
