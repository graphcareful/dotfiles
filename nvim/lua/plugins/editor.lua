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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { buildScripts = { enable = true } },
              procMacro = { all_targets = true, enable = true },
            },
          },
        },
      },
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/snacks.nvim",
    opts = {
      gh = {
        -- your gh configuration comes here
        -- or leave it empty to use the default settings
      },
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
    keys = {
      {
        "<leader>fh",
        function()
          require("snacks").picker.files({ hidden = true, ignored = true })
        end,
        desc = "Find Files (Hidden inc.)",
      },
      {
        "<leader>fF",
        function()
          require("snacks").picker.files({ dirs = { vim.fn.expand("%:p:h") }, root = false })
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>sf",
        function()
          require("snacks").picker.grep({ hidden = true, ignored = true })
        end,
        desc = "Grep (Hidden files)",
      },
      {
        "<leader>sG",
        function()
          require("snacks").picker.grep({ dirs = { vim.fn.expand("%:p:h") }, root = false })
        end,
        desc = "Live Grep (cwd)",
      },
    },
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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "SmiteshP/nvim-navic" },
    opts = function(_, opts)
      -- keep whatever you have in statusline
      opts.winbar = {
        lualine_a = { { "filename", path = 1 } }, -- path=1 = relative, path=2 = absolute
        lualine_c = {
          {
            "navic",
            color_correction = "dynamic", -- adjusts highlight groups
            navic_opts = { separator = " > " },
          },
        },
      }
      opts.inactive_winbar = {
        lualine_a = { "filename" },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
}
