# /// script
# requires-python = ">=3.12,<3.13"
# dependencies = [
#     "marimo[lsp,recommended]>=0.24",  # lsp = completion/hover inside the sandbox
#     # Must match the cluster's Databricks Runtime (major.minor); 17.3 also works on serverless.
#     # It ships its own `pyspark` - do NOT add `pyspark` from PyPI, it breaks Databricks Connect.
#     "databricks-connect~=17.3.0",
# ]
# ///

import marimo

__generated_with = "0.24.2"
app = marimo.App(width="medium")

with app.setup(hide_code=True):
    # Creates `spark` and `dbutils`, just like a Databricks notebook.
    # Config: profile in ~/.databrickscfg (DEFAULT or $DATABRICKS_CONFIG_PROFILE).
    # `cluster_id` in the profile -> that cluster, otherwise -> serverless.
    import marimo as mo

    def _connect():
        import os

        from databricks.connect import DatabricksSession
        from databricks.sdk import WorkspaceClient

        try:
            w = WorkspaceClient()
            if not (w.config.cluster_id or w.config.serverless_compute_id):
                w.config.serverless_compute_id = "auto"
            return DatabricksSession.builder.sdkConfig(w.config).getOrCreate(), w.dbutils
        except Exception as e:
            profile = os.getenv("DATABRICKS_CONFIG_PROFILE", "DEFAULT")
            raise RuntimeError(
                f"Could not connect to Databricks.\n{e}\n\n"
                f"Log in with: databricks auth login --profile {profile}"
            ) from None

    spark, dbutils = _connect()


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
