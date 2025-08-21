return {
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "maxmx03/solarized.nvim" },
  { "navarasu/onedark.nvim" },
  {
    "sainnhe/sonokai",
    config = function()
      -- Set Sonokai options
      -- vim.g.sonokai_style = "default" -- other options: default, atlantis, shusia, maia, espresso
      -- vim.g.sonokai_transparent_background = 1
    end,
  },
  { "vague2k/vague.nvim" },
  { "shaunsingh/nord.nvim" },
  { "UtkarshVerma/molokai.nvim" },
  { "neanias/everforest-nvim" },
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
}
