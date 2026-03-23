{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  github.codespaces
  github.github-vscode-theme
  # github.remotehub
  github.vscode-github-actions
  github.vscode-pull-request-github

  # ms-vscode.vscode-github-issue-notebooks

  ziyasal.vscode-open-in-github
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "remotehub";
    publisher = "github";
    version = "0.65.2026031901";
    sha256 = "EhaUlH86DNB/YXYdCtfsXa/5BZYrKsQpYzLFxokyQS4=";
  }
  {
    name = "vscode-github-issue-notebooks";
    publisher = "ms-vscode";
    version = "0.0.134";
    sha256 = "49p5i9euvxILb6MqjSkNmwb+0k6+wp/AQCepKqaDjLg=";
  }
]