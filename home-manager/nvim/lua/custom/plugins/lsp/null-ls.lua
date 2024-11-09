local M = {}

M.setup = function()
  -- comes from nvimtools/none-ls.nvim
  local null_ls = require("null-ls")
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = false,
    sources = {
      diagnostics.eslint_d,
    },
  })
end

return M
