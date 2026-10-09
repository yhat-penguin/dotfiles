return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              validate = true,
              format = { enable = true },
              schemaStore = { enable = false },
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
                ["https://json.schemastore.org/azure-pipelines.json"] = {
                  "azure-pipelines.yml",
                  "azure-pipelines/*.yml",
                  ".azure/**/*.yml",
                  ".azure/**/*.yaml",
                },
                [".databricks/bundle_config_schema.json"] = {
                  "databricks.yml",
                  "databricks.yaml",
                  "bundles/**/*.yml",
                  "bundles/**/*.yaml",
                  "resources/**/*.yml",
                  "resources/**/*.yaml",
                },
              },
            },
          },
        },
      },
    },
  },
}
