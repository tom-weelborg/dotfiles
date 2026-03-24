{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  github.copilot
  github.copilot-chat
  # github.copilot-workspace
  
  # ms-azure-load-testing.microsoft-testing
  
  # ms-azuretools.vscode-azure-github-copilot
  # ms-azuretools.vscode-azure-mcp-server

  # vscjava.migrate-java-to-azure
  # vscjava.vscode-java-upgrade
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "copilot-workspace";
    publisher = "github";
    version = "0.5.4";
    sha256 = "IyXT2I1ho8P3vW1bvZHr/m+ui9q1LN4DXehP0BYnO2U=";
  }
  {
    name = "microsoft-testing";
    publisher = "ms-azure-load-testing";
    version = "0.2.0";
    sha256 = "TASzgBUcAWlTUGmsHONo/r4YmH3itVbEOEhCLJlFui0=";
  }
  {
    name = "vscode-azure-github-copilot";
    publisher = "ms-azuretools";
    version = "1.0.178";
    sha256 = "s6XxTdTTcFl1Yk6KoSms9HtaKEKzZlbTNTI15/Q80d4=";
  }
  {
    name = "vscode-azure-mcp-server";
    publisher = "ms-azuretools";
    version = "2.0.31";
    sha256 = "layrL5ouPRhBT3uL5JWtDYPdgc8p9J3/2f6+lgjkkr4=";
  }
  {
    name = "migrate-java-to-azure";
    publisher = "vscjava";
    version = "1.14.2026031601";
    sha256 = "Fqda9DmEy/K820NYesd0c5ml07dvHXfwCDxOBEsh59o=";
  }
  {
    name = "vscode-java-upgrade";
    publisher = "vscjava";
    version = "2.0.6";
    sha256 = "X5YeFGQAOWlGvs+z9Gdph3QSKps8K5VfPK+gfhLbBs0=";
  }
]