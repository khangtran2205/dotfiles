return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'pyrefly',
        'ruff',
        'gopls',
        'tsgo',
        'lua_ls',
        'stylua',
        'oxlint',
        'oxfmt',
        'yamlls',
        'marksman',
        'rust_analyzer',
        'terraformls',
      },
      automatic_enable = true,
    },
  },
}
