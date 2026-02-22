{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  james-yu.latex-workshop
  # mathematic.vscode-latex
  tecosaur.latex-utilities
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-latex";
    publisher = "mathematic";
    version = "1.3.0";
    sha256 = "/mbMpel9JHmSh0GN/wIbFi/0voaQBxGn0SueZlUFZUc=";
  }
]