local function open_file_browser(opts)
  local telescope = require("telescope")

  telescope.extensions.file_browser.file_browser(vim.tbl_deep_extend("force", {
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  }, opts or {}))
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      { "<leader>sf", false },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>fd",
        function()
          open_file_browser()
        end,
        desc = "File Dir Browser (root dir)",
      },
      {
        "<leader>fD",
        function()
          open_file_browser({
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "File Dir Browser (cwd)",
      },
    },
  },
}
