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

    local transparent = { bg = 'NONE' }

    opts.options.theme = {
      normal = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
      insert = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
      visual = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
      replace = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
      command = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
      inactive = {
        a = transparent,
        b = transparent,
        c = transparent,
      },
    }

    opts.options.section_separators = {
      left = '',
      right = '',
    }
    opts.options.component_separators = {
      left = '',
      right = '',
    }
    opts.sections.lualine_y = {
      { lsp_clients, separator = ' ', padding = { left = 1, right = 0 } },
    }
    opts.sections.lualine_z = {
      { 'location', padding = { left = 1, right = 0 } },
    }
  end,
}
