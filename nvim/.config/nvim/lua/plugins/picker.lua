return {
  {
    "folke/snacks.nvim",
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
