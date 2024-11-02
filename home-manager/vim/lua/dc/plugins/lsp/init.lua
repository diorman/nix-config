require("dc.plugins.lsp.diagnostic").setup()
require("fidget").setup({})

-- TODO: need to find an alternative to null-ls which is deprecated.
require("dc.plugins.lsp.null-ls").setup()

local lspconfig = require("lspconfig")
local core = require("dc.plugins.lsp.core")
local servers = {
  -- golang
  gopls = {
    enabled = true,
    make_config = core.make_config,
  },

  -- nix
  nil_ls = {
    enabled = true,
    make_config = require("dc.plugins.lsp.nil-ls").make_config,
  },

  -- lua
  lua_ls = {
    enabled = true,
    make_config = require("dc.plugins.lsp.lua-ls").make_config,
  },

  -- typescript
  ts_ls = {
    enabled = true,
    make_config = require("dc.plugins.lsp.ts-ls").make_config,
  },

  -- rust
  rust_analyzer = {
    enabled = true,
    make_config = core.make_config,
  },
}

for server, settings in pairs(servers) do
  if settings.enabled then
    lspconfig[server].setup(settings.make_config())
  end
end
