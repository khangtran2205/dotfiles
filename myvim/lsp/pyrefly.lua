return {
  settings = {
    python = {
      analysis = {
        inlayHints = {
          callArgumentNames = 'partial', -- or "all"
          functionReturnTypes = true,
          variableTypes = true,
          pytestParameters = true,
        },
      },
    },
  },
}
