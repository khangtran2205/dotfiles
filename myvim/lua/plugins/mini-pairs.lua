return {
  "nvim-mini/mini.pairs",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.pairs").setup({
      modes = { insert = true, command = true, terminal = false }
    })
  end
}
