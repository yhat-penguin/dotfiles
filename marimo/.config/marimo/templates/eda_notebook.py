# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "marimo[lsp,recommended]>=0.24",
#     "polars>=1.0",
#     "plotly>=5.24",
#     "numpy>=2.0",
# ]
# ///

import marimo

__generated_with = "0.25.0"
app = marimo.App(width="medium")

with app.setup(hide_code=True):
    import marimo as mo
    import numpy as np
    import polars as pl
    import plotly.express as px
    import plotly.graph_objects as go


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
