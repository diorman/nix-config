require("custom.plugins.lsp.diagnostic").setup()
require("fidget").setup({})

local lspconfig = require("lspconfig")
local core = require("custom.plugins.lsp.core")
local servers = {
  -- golang
  gopls = {
    enabled = true,
    make_config = core.make_config,
  },

  -- nix
  nil_ls = {
    enabled = true,
    make_config = core.make_config,
  },

  -- lua
  lua_ls = {
    enabled = true,
    make_config = require("custom.plugins.lsp.lua-ls").make_config,
  },

  -- typescript
  ts_ls = {
    enabled = true,
    make_config = core.make_config,
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
