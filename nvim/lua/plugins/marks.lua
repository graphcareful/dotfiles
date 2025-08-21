return {
  "chentoast/marks.nvim",
  config = function()
    require("marks").setup({
      -- default_mappings = false,
    })
  end,
  keys = {
    { "<leader>m", desc = "marks" },
    { "<leader>ml", "<cmd>Telescope marks<cr>", desc = "List marks" },
    { "<leader>md", "<Plug>(Marks-deletebuf)", desc = "Delete all marks" },
    { "<leader>mn", "<Plug>(Marks-next)", desc = "Next mark" },
    { "<leader>mp", "<Plug>(Marks-prev)", desc = "Previous mark" },
  },
}
