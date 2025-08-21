return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  keys = {
    -- {
    --   "<leader>r",
    --   desc = "rust",
    -- },
    {
      "<leader>rr",
      function()
        vim.cmd.RustLsp("runnables")
      end,
      desc = "Rustacean: Run Runnable",
    },
    {
      "<leader>rd",
      function()
        vim.cmd.RustLsp("debuggables")
      end,
      desc = "Rustacean: Debug Runnable",
    },
    {
      "<leader>rh",
      function()
        vim.cmd([[RustLsp hover actions]])
      end,
      desc = "Rustacean: Hover Actions",
    },
  },
}
