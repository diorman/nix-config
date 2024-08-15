local core = require("dc.plugins.lsp.core")
local M = {}

M.make_config = function()
  return core.make_config({
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  })
end

return M
