# dotfiles

My configs for Neovim, tmux and marimo.

## Setup on a new machine

```bash
brew install stow
git clone <this repo> ~/dotfiles
cd ~/dotfiles
stow nvim tmux marimo
```

Stow creates symlinks from `~/.config/nvim`, `~/.config/tmux` and `~/.config/marimo` to the folders in this repo. Editing a file in `~/.config` changes it here too.

If stow complains that a file already exists, move the old config out of the way first, e.g. `mv ~/.config/nvim ~/.config/nvim.bak`.

To remove one config, run `stow -D nvim` (or `tmux`, `marimo`).

## nvim

LazyVim with mostly default settings. The extras I use are listed in `lazyvim.json`: Python, SQL, YAML, Docker, testing, debugging and a few more. Python uses pyrefly and ruff.

Plugins install on their own the first time you open nvim.

## tmux

A small config:

- mouse support
- windows and panes are numbered from 1
- vi keys in copy mode: `v` to select, `y` to copy
- copying goes to the system clipboard
- true color

## marimo

Global marimo config with vim mode, my own shortcuts and ruff formatting on save.

Install marimo:

```bash
uv tool install "marimo[lsp,recommended]" --with pyrefly
```

Open a notebook:

```bash
marimo edit --watch --sandbox notebook.py
```

With `--watch`, changes made to the file in nvim show up in the browser. With `--sandbox`, each notebook gets its own environment.

To start a new notebook, copy a template from `~/.config/marimo/templates/`:

- `marimo_notebook.py` is an empty notebook
- `eda_notebook.py` comes with polars, numpy and plotly
- `databricks_notebook.py` sets up `spark` and `dbutils`. It needs a profile in `~/.databrickscfg`.

Optionally, to make `ruff.toml` the default ruff config for all projects:

```bash
mkdir -p ~/.config/ruff
ln -sfn ~/.config/marimo/ruff.toml ~/.config/ruff/ruff.toml
```

## Good to know

- Changing settings in the marimo UI writes them straight to `marimo.toml`, so check `git diff` afterwards.
- Notebook outputs (`__marimo__/`), logs and caches are not committed, because they can contain data.
