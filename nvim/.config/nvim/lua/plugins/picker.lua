-- Keymaps picker: icons, description, key sequence, shortcut and mode.
local lhs_width, rhs_width = 15, 25
local fixed_width = 3 + 2 + lhs_width + 1 + rhs_width + 1 + 3

local function keymap(item, picker)
  local k, a = item.item, Snacks.picker.util.align
  local win = picker.list and picker.list.win and picker.list.win.win
  local width = win and vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_width(win) or 120
  local desc_width = math.max(20, math.min(50, width - fixed_width))
  local icon, icon_hl = "", nil
  if package.loaded["which-key"] then
    icon, icon_hl = require("which-key.icons").get({ keymap = k, desc = k.desc })
  end
  local has_rhs = k.rhs and k.rhs ~= ""
  return {
    { a(icon, 3), icon_hl },
    { a(k.desc or "", desc_width, { truncate = true }) },
    { "  " },
    { a(Snacks.util.normkey(k.lhs), lhs_width), "SnacksPickerKeymapLhs" },
    { " " },
    { a(has_rhs and k.rhs or "callback", rhs_width, { truncate = true }), has_rhs and "SnacksPickerKeymapRhs" or "Function" },
    { " " },
    { k.mode, "SnacksPickerKeymapMode" },
  }
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          keymaps = {
            format = keymap,
            layout = { preview = false },
          },
        },
      },
    },
    keys = {
      {
        "<leader><leader>",
        function()
          LazyVim.pick("files", { hidden = true, exclude = { ".venv" } })()
        end,
        desc = "Find Files (Root Dir)",
      },
    },
  },
}
