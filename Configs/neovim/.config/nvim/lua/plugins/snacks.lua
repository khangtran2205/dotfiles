return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      exclude = {
        ".git",
        "node_modules",
      },
      sources = {
        explorer = {
          hidden = true,
          win = {
            input = {
              title = "{title}",
            },
          },
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },
    },
    terminal = {
      win = {
        position = "float",
        width = 0.9,
        height = 0.9,
        border = "rounded",
      },
    },
    indent = {
      enabled = false,
    },
  },
}
