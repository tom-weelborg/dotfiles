{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  # GitHub Markdown Preview
  bierner.github-markdown-preview
  bierner.markdown-checkbox
  bierner.markdown-emoji
  bierner.markdown-footnotes
  bierner.markdown-mermaid
  bierner.markdown-preview-github-styles
  # bierner.markdown-yaml-preamble

  davidanson.vscode-markdownlint
  goessner.mdmath
  # shd101wyy.markdown-preview-enhanced
  yzhang.markdown-all-in-one
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "markdown-yaml-preamble";
    publisher = "bierner";
    version = "0.1.0";
    sha256 = "5eIrLbkHz73JStqaIqoNXWXWA8A2dEVFulp4nXczi/Y=";
  }
]