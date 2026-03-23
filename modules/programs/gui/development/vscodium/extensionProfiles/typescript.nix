{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  pmneo.tsimporter
  yoavbls.pretty-ts-errors
]
++
import ./javascript.nix { inherit pkgs; }