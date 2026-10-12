{ ... }@inputs:
let
  lib = inputs.nixpkgs.lib;
  
  defaultFile = "default.nix";

  discoveredOverlays = map
    (name: import (./. + "/${name}"))
    (builtins.attrNames (
      lib.filterAttrs
        (name: value:
          (
            value == "regular"
            &&
            lib.hasSuffix ".nix" name
            &&
            name != defaultFile
          )
          ||
          (
            value == "directory"
            &&
            builtins.pathExists (./. + "/${name}/${defaultFile}")
          )
        )
        (builtins.readDir ./.)
    ))
  ;
in
{
  nixpkgs.overlays = [
    inputs.firefox-addons.outputs.overlays.default
    inputs.nix-vscode-extensions.overlays.default
  ] ++ discoveredOverlays;
}
