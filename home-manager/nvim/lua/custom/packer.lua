return require("packer").startup(function(use)
  use({
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
  })

  use({ -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  use({ -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  })

  use({ -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
  })

  use({ -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    requires = {
      -- Useful status updates for LSP
      "j-hui/fidget.nvim",
      -- tag = "legacy",
    },
  })

  use({ -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
  })

  use({ -- Autoformat
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        format_on_save = function(_)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          -- local disable_filetypes = { c = true, cpp = true }
          -- local lsp_format_opt
          -- if disable_filetypes[vim.bo[bufnr].filetype] then
          --   lsp_format_opt = "never"
          -- else
          --   lsp_format_opt = "fallback"
          -- end
          -- return {
          --   timeout_ms = 500,
          --   lsp_format = lsp_format_opt,
          -- }
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end,
        formatters_by_ft = {
          lua = { "stylua" },
          nix = { "nixfmt" },
          typescript = { "prettierd" },
        },
      })
    end,
  })

  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP features via Lua
  use("lewis6991/gitsigns.nvim") -- Git
  use("numToStr/Comment.nvim") -- Comments
  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
  use("windwp/nvim-autopairs") -- Autopairs
  use("nvim-lualine/lualine.nvim") -- Fancier statusline
  use("EdenEast/nightfox.nvim") -- Theme
end)
