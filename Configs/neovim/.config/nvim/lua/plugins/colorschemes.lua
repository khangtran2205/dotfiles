return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = true
      },
      term_colors = true,
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" }
        },
        inlay_hints = { background = false },
        integrations = {
          mini = { enabled = true }
        }
      },
      color_overrides = {
        mocha = {
          mauve = "#f38ba8",
          pink = "#eba0ac"
        }
      }
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme "catppuccin-nvim"
    end
  }
}
