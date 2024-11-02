local M = {}

M.setup = function()
  -- comes from nvimtools/none-ls.nvim
  local null_ls = require("null-ls")
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    debug = false,
    sources = {
      diagnostics.eslint_d,
      formatting.prettierd,
      formatting.stylua,
    },
  })
end

return M
