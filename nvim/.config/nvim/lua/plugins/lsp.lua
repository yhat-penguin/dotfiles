return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        pyright = { enabled = false },
        pyrefly = {},
        ruff = {},
        pytest_language_server = { enabled = false },
      },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = {
          auto_show = true,
        },
        list = {
          selection = {
            preselect = false,
          },
        },
      },
    },
  },
}
