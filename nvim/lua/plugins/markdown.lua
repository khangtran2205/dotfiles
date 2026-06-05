return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    opts = {
      heading = {
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
      code = {
        language_pad = 0,
        width = 'full',
        right_pad = 0,
        style = 'language',
        language_border = '',
      },
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)

      local hl_groups = {
        -- Header
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      }

      for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'none' })
      end
    end,
  },
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters = {
        ['markdownlint-cli2'] = {
          args = { '--disable', 'MD013', '--' },
        },
      },
    },
  },
}
