{ ... }@inputs:
{
  nixpkgs.overlays = [
    inputs.firefox-addons.outputs.overlays.default
    inputs.nix-vscode-extensions.overlays.default

    (import ./arcmenu.nix)
    (import ./lib.nix)
    (import ./requestly-firefox-addon.nix)
    (import ./soapui.nix)
  ];
}
