{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  angular.ng-template
  cyrilletuzi.angular-schematics
  # johnpapa.angular2
  # mikael.angular-beastcode
  # obenjiro.arrr
  segerdekort.angular-cli
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "angular2";
    publisher = "johnpapa";
    version = "18.0.2";
    sha256 = "h/qmDHG5zzDh76e4yq+s0vjNBYXupPqV5V72opEQsIs=";
  }
]