return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local function isRecording ()
      local reg = vim.fn.reg_recording()
      if reg == "" then return "" end
      return "recording @" .. reg
    end
    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {{"branch", icon=""}, "diff"},
        lualine_c = {"diagnostics"},
        lualine_x = {isRecording, "filename"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
  }
  end
}
