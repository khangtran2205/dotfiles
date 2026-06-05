return {
  'nvim-lualine/lualine.nvim',
  opts = function(_, opts)
    local function lsp_clients()
      local clients = vim.lsp.get_clients { bufnr = 0 }
      if #clients == 0 then return 'No LSP' end

      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return ' ' .. table.concat(names, ', ')
    end

    opts.sections.lualine_y = {
      { lsp_clients, separator = ' ', padding = { left = 1, right = 1 } },
    }
    opts.sections.lualine_z = {
      { 'location', padding = { left = 1, right = 1 } },
    }
  end,
}
