local function snacks_horizontal_layout()
  return {
    box = "vertical",
    backdrop = false,
    width = 0.8,
    height = 0.9,
    border = "none",
    {
      box = "vertical",
      {
        win = "input",
        height = 1,
        border = "rounded",
        title = "{title} {live} {flags}",
        title_pos = "center",
      },
      { win = "list", title = " results ", title_pos = "center", border = "rounded" },
    },
    {
      win = "preview",
      title = "{preview:preview}",
      border = "rounded",
      title_pos = "center",
    },
  }
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = {
          layout = {
            backdrop = false,
          },
        },
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              layout = { position = "left" },
            },
          },
          files = {
            layout = {
              layout = snacks_horizontal_layout(),
            },
          },
          grep = {
            layout = {
              layout = snacks_horizontal_layout(),
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
      vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#316c71", bg = "none", nocombine = true })
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      {
        "<leader>sf",
        function()
          require("flash").jump({ search = { mode = "search" } })
        end,
        desc = "Flash Search 🔦",
      },
      { "<leader>sf", false },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
      {
        "<leader>gn",
        function()
          local neogit = require("neogit")
          neogit.open({ kind = "auto" })
        end,
        desc = "Open Neogit",
      },
    },
  },
}
