{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  # ms-azuretools.azure-dev
  # ms-azuretools.vscode-azure-github-copilot # not included here, check in copilot.nix
  # ms-azuretools.vscode-azureappservice
  # ms-azuretools.vscode-azurecontainerapps
  # ms-azuretools.vscode-azurefunctions
  # ms-azuretools.vscode-azureresourcegroups
  # ms-azuretools.vscode-azurestaticwebapps
  # ms-azuretools.vscode-azurestorage
  # ms-azuretools.vscode-azurevirtualmachines
  # ms-azuretools.vscode-bicep
  # ms-azuretools.vscode-cosmosdb

  # ms-vscode.azure-account # deprecated
  # ms-vscode.vscode-node-azure-pack
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "azure-dev";
    publisher = "ms-azuretools";
    version = "0.10.0";
    sha256 = "76CCsBUtLPmuLm3VBltRseiOg8z1iEPTNJNPENWe7Qw=";
  }
  # {
  #   name = "vscode-azure-github-copilot";
  #   publisher = "ms-azuretools";
  #   version = "1.0.178";
  #   sha256 = "dL3WMN8yJa4Sxuj/xH27Tx6F1jSy/6ngeZDmHYbgkGg=";
  # }
  {
    name = "vscode-azureappservice";
    publisher = "ms-azuretools";
    version = "0.26.5";
    sha256 = "ZRdUfzmZbx3pDaitLAXW9I4mlhOJAZMREz83mTPijzU=";
  }
  {
    name = "vscode-azurecontainerapps";
    publisher = "ms-azuretools";
    version = "0.11.0";
    sha256 = "EYnzYXhKnLgUySrqvanioCqFhrNuepVtkEZqzYHRuw0=";
  }
  {
    name = "vscode-azurefunctions";
    publisher = "ms-azuretools";
    version = "1.20.3";
    sha256 = "jCUnzt3TjmuM25F+PhQfrAVTTJ89turlukloFrzzPjI=";
  }
  {
    name = "vscode-azureresourcegroups";
    publisher = "ms-azuretools";
    version = "0.12.3";
    sha256 = "iWcgp4vyuDi4yE/Zq07H/J+NGQsiRbuJWG+5OqmPm/4=";
  }
  {
    name = "vscode-azurestaticwebapps";
    publisher = "ms-azuretools";
    version = "0.13.2";
    sha256 = "QiAkjf11sk9b21cC3vYNoUy4dUiBv7VH8CEh2S/B958=";
  }
  {
    name = "vscode-azurestorage";
    publisher = "ms-azuretools";
    version = "0.17.1";
    sha256 = "97fNMiewzOATcxumqAuy1EQKlVLWz0JHu7sVODzWiCI=";
  }
  {
    name = "vscode-azurevirtualmachines";
    publisher = "ms-azuretools";
    version = "0.6.10";
    sha256 = "SZ48U1XLGJxwnxJrCQ/SMRJw+5ocsUuzS6nGOw8fzVM=";
  }
  {
    name = "vscode-bicep";
    publisher = "ms-azuretools";
    version = "0.41.2";
    sha256 = "8k2de208t/ZAVJzxkjd0qcqgVx523hEWWe5d1uvthFU=";
  }
  {
    name = "vscode-cosmosdb";
    publisher = "ms-azuretools";
    version = "0.33.1";
    sha256 = "JBBUIf1nELYXMfWgn2v8leG9S2rScNe9jeh3rqTT4wg=";
  }
  # {
  #   name = "azure-account";
  #   publisher = "ms-vscode";
  #   version = "0.13.0";
  #   sha256 = "x/t4IjzxsOGv04BzSDWrQ/Lhd4J2mJ/iXwt1XXpwm74=";
  # }
  {
    name = "vscode-node-azure-pack";
    publisher = "ms-vscode";
    version = "1.8.0";
    sha256 = "CzUrGskRwxqlimFMVgvBtB/o/oOqpcERr7wvsV8667A=";
  }
]