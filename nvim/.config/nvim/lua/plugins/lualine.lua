return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = LazyVim.config.icons

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
        -- Clean, slim text separators reminiscent of standard Neovim
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        -- Mode indicator (classic full mode name: NORMAL, INSERT, VISUAL, etc.)
        lualine_a = {
          { "mode" },
        },

        -- Version control: branch + diff stats
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },

        -- File information & IDE diagnostics / problems
        lualine_c = {
          {
            "filename",
            path = 1, -- 1 = relative path, 0 = just filename
            symbols = {
              modified = " [+]",
              readonly = " [RO]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },

        -- IDE details: active LSP client & file details
        lualine_x = {
          -- {
          --   -- Active LSP server name(s)
          --   function()
          --     local clients = vim.lsp.get_clients({ bufnr = 0 })
          --     if #clients == 0 then
          --       return ""
          --     end
          --     local names = {}
          --     for _, client in ipairs(clients) do
          --       table.insert(names, client.name)
          --     end
          --     return " " .. table.concat(names, ", ")
          --   end,
          --   cond = function()
          --     return #vim.lsp.get_clients({ bufnr = 0 }) > 0
          --   end,
          -- },
          { "filetype", icon_only = false },
        },

        -- Classic Neovim position: line:column
        lualine_y = {
          { "location", padding = { left = 1, right = 1 } },
        },

        -- File percentage (% of file: Top, Bot, 45%, etc.)
        lualine_z = {
          { "progress", padding = { left = 1, right = 1 } },
        },
      },
    }
  end,
}
