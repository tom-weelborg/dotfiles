{ ... }@inputs:
{
  nixpkgs.overlays = [
    (import ./lib.nix)
    (import ./requestly-firefox-addon.nix)

    inputs.nix-vscode-extensions.overlays.default
  ];
}