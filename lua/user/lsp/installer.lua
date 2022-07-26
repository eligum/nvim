local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific servers
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    --if server.name == "pyright" then
    --    local pyright_opts = require("user.lsp.settings.pyright")
    --    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    --end

    -- This setup() function is exactly the same as lspconfig's setup
    -- Refer to https://github.com/neovim/nvim-lspconfig/ig/blob/master
    server:setup(opts)
end)

