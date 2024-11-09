require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },

  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end)

    -- Actions
    map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Git: Stage hunk" })
    map("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Git: Stage hunk" })

    map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git: Reset hunk" })
    map("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Git: Reset hunk" })

    map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Git: Stage buffer" })
    map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Git: Undo stage hunk" })
    map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Git: Reset buffer" })
    map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Git: Toggle deleted" })
    map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git: Preview hunk" })

    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git: Toggle blame on current line" })
    map("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "Git: Blame line" })

    map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git: Diff" })
    map("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end, { desc = "Git: Diff" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git: Select hunk" })
  end,
})
