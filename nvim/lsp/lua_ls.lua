---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
      completion = {
        callSnippet = 'Replace',
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
