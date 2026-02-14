{
  nixpkgs.overlays = [
    (import ./lib.nix)
    (import ./requestly-firefox-addon.nix)
  ];
}