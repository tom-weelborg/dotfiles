{
  nixpkgs.overlays = [
    (import ./requestly-firefox-addon.nix)
  ];
}