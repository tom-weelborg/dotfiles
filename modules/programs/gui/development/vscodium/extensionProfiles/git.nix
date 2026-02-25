{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  # Git Extension Pack
  alefragnani.project-manager
  codezombiech.gitignore
  # donjayamanne.git-extension-pack
  donjayamanne.githistory
  eamodio.gitlens
  ziyasal.vscode-open-in-github

  mhutchie.git-graph
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "git-extension-pack";
    publisher = "donjayamanne";
    version = "0.1.3";
    sha256 = "g9uHWaKVkQtEEjU2TzZTOrPVCAbbO/BVSCEvXUvAlUg=";
  }
]