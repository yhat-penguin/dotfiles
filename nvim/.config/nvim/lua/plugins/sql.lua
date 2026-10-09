return {
  -- LazyVim's sql extra defaults sqlfluff to the `ansi` dialect, which
  -- doesn't understand Databricks SQL (catalogs, backtick identifiers,
  -- Lakeflow Declarative Pipelines DDL, etc.) — switch both the linter
  -- and formatter to the `databricks` dialect.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        sqlfluff = {
          args = { "lint", "--format=json", "--dialect=databricks", "--exclude-rules=RF05", "-" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters.sqlfluff.args = { "format", "--dialect=databricks", "--exclude-rules=RF05", "-" }
      -- conform's built-in sqlfluff formatter refuses to run unless a
      -- .sqlfluff/pyproject.toml/etc is found upward from the file, to read
      -- dialect config from there. We pass --dialect explicitly above, so
      -- that lookup is unnecessary and was silently disabling formatting in
      -- any .sql file not sitting in a Python project root.
      opts.formatters.sqlfluff.require_cwd = false
    end,
  },
}
