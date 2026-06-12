{ ... }@inputs:
{
  nixpkgs.overlays = [
    inputs.firefox-addons.outputs.overlays.default
    inputs.nix-vscode-extensions.overlays.default

    (import ./lib.nix)
    (import ./requestly-firefox-addon.nix)
  ];
}
