local ok, _ = pcall(require, "lspconfig")
if not ok then
    return
end

require("user.lsp.installer")
require("user.lsp.handlers").setup()
