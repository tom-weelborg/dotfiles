{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  docker.docker
  ms-azuretools.vscode-containers
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
]