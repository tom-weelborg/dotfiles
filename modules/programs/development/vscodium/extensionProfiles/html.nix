{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  ecmel.vscode-html-css
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
]