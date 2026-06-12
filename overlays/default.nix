{ ... }@inputs:
{
  nixpkgs.overlays = [
    inputs.firefox-addons.outputs.overlays.default
    
    (import ./lib.nix)
    (import ./requestly-firefox-addon.nix)

    inputs.nix-vscode-extensions.overlays.default
  ];
}
