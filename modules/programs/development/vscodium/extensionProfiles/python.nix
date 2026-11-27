{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  batisteo.vscode-django
  charliermarsh.ruff
  # KevinRose.vsc-python-indent

  ms-python.debugpy
  ms-python.isort
  ms-python.python
  ms-python.vscode-pylance
  # ms-python.vscode-python-envs

  ms-toolsai.jupyter
  ms-toolsai.jupyter-keymap
  ms-toolsai.jupyter-renderers
  ms-toolsai.vscode-jupyter-cell-tags
  ms-toolsai.vscode-jupyter-slideshow

  njpwerner.autodocstring
  wholroyd.jinja
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.21.0";
    sha256 = "SvJhVG8sofzV0PebZG4IIORX3AcfmErDQ00tRF9fk/4=";
  }
  {
    name = "vscode-python-envs";
    publisher = "ms-python";
    version = "1.23.10791018";
    sha256 = "yHCwqedOhhgMWM53g29Sr7WX4D7ugqtqFgxXuIdWAnU=";
  }
]